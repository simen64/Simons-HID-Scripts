# Payload used to deliver my Discord controlled RAT to a target computer

## Fork

The file that this payload downloads can be found in my repo called [Simple-Discord-RAT](https://github.com/simen64/Simple-discord-RAT)

## Disclaimer!

**DONT** use this on any computer you dont have full authorization to attack!
I am **NOT** responsible for anything harmful done with this paylod.

## What it does

This delivers my discord controlled RAT to a target computer with your own bot token. Read more [here](https://github.com/simen64/Simple-discord-RAT).

## Dependencies

Although the RAT works better on Linux as that was where it was developed this payload only works on windows. This is because Linux is more secure and isnt easy to set processes to run at startup without knowing the sudo password, and other reasons.

- Windows
- Python
- User is admin

## How to use

## NoAdmin

The original payload requires admin so it can place itself in the startup folder so it has pescistance. But i have made a version that doesnt require admin, but in return doesnt stay on the computer if the traget turns the coputer off.

### Pico-Ducky

If you have a [pico-ducky](https://github.com/dbisu/pico-ducky) which is what this payload was originally built for you just download the ``.dd`` file and place it in the root of your pico directory. If you have a pico-ducky without wifi you need to rename it to ``payload.dd`` ``payload2.dd`` ``payload3.dd`` or ``payload4.dd`` read more here [here](https://github.com/dbisu/pico-ducky).

### Evilcrow cable-pro

I am working on a port to the EvilCrow cable.

### P4wnP1 A.L.O.A

I am working on a version for HID script

### Any other ducky script compatible tools

I havent tested any others but if you do please open up an issue and tell me how it went


