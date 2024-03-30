# Discord RAT V2 Deployer

## RAT V2 Repo

This payload deploys the Discord RAT you can find from my repo [here](https://github.com/simen64/Discord-RAT-v2)

## Disclaimer!

DONT use this on any computer you dont have full authorization to attack! I am NOT responsible for anything harmful done with this paylod.

## Dependenices

- Windows 10 or 11
- Python
- Pip

## What it does

This payload deploys my Discord RAT V2 using your credentials. It also sets up persistance as this is not included in the RAT (yet). Aswell as it sets everything up as installing pip packages etc.

## How to use

### Set up

To set up the RAT checkout the repo [here](https://github.com/simen64/Discord-RAT-v2)

### What version to use

There are two versions of the payload, the normal one and the hotplug one.  
The normal version opens a hidden powershell window and types in a set of powershell commands to set up the needed pip packages, persistance, and getting the RAT file.  
With the hotplug version it only types in the run box downloading the `RAT-V2-deployer.ps1` script, which does the same as is being typed in the normal version.  
The hotplug version is faster but less stealthy and uses the infamous `iwr | iex`, if you have time i recommend the normal version.

Heres a time comparison with the O.MG Plug using USB overclock at `1000%` on my Thinkpad E495 with Windows 10. Note that time depends on your system, this is only to give an understanding of the differences.  

**Normal Version:**  
Time from pressing run: 8 Seconds  
Time from appearence on screen: 7.5 seconds

**Hotplug Version**  
Time from pressing run: 3 Seconds  
Time from appearence on screen: 2.2 seconds

### O.MG Devices

To use these payloads on the o.mg devices just copy the contents of the payload into the editor.

### Other DuckyScript devices

This payload was written for the O.MG devices, but it should work with any other duckyscript devices with some slight modifications.
