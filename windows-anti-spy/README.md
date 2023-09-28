# What it does

This payload edits the windows hosts file to remove some of microsofts spyware from windows.

# How to use

## Pico-Ducky

If you have a [pico-ducky](https://github.com/dbisu/pico-ducky) which is what this payload was originally built for you just download the ``windows-anti-spy-pico.dd`` and place it in the root of your pico directory. If you have a pico-ducky without wifi you need to rename it to ``payload.dd`` ``payload2.dd`` ``payload3.dd`` or ``payload4.dd`` read more here [here](https://github.com/dbisu/pico-ducky).

## Any other ducky script compatible tools

I havent tested any others but if you do please open up an issue and tell me how it went

# How it works

I recommend watching The PC security channel's [video](https://www.youtube.com/watch?v=IJr2DcffquI) on how this works, but heres the short version. This payload edits window's configuration so that some of the known IP's used to send user data is redirected to the computers loopback address. And the loopback adress means the data never leaves the system. This ofcourse doesnt remove all spyware from windows, but it helps.

