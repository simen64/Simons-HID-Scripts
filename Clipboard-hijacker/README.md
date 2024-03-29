# Clipboard Hijacker

## What it does

This payload open powershell and types a powershell script in, but why not just download it? Doing it like this slows down the execution time, but it makes it much more difficult to detect. No sketchy outgoing traffic to a file, only traffic getting sent is the discord traffic which is also SSL encrypted. Also everything runs in memory so antivirus cant scan for sketchy files. The one downside with this is percistance, as if the computer reboots the script wont be active anymore.

Now what the powershell script does, it gets the users clipboard contents and sends them to you over a discord webhook.

## How to use

The payload was made for the O.MG plug which means it uses a slightly modified version of Ducky Script 2. This should technically make it compatible with most other Ducky Script enabled devices just with some sligt modifications.  
Do note that payload is not done when you recieve a discord notification saying `Connection made` but rather when the caps-lock turns on.

If you dont want to use a BadUsb to deliver the payload you can just download the .ps1 script.

For both, remember to place your discord webhook in the `$dc` variable

## Why so long payload

When i made this payload i wanted to experiment with living off the land in powershell and type out the whole program, and it isnt so long so it works ok. I have later realised i could have made it much shorter, but i dont plan on updating it but if you want your welcome to!
