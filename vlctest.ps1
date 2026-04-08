Show-Step "Installing VLC Player..."
$VLCPath = "$env:TEMP\vlc.exe"

try {
    Invoke-WebRequest -Uri "https://get.videolan.org/vlc/3.0.21/win64/vlc-3.0.21-win64.exe" `
            -OutFile $VLCPath `
            -Headers @{ "User-Agent" = "Mozilla/5.0" }
    
}
catch {
    Start-Process "https://get.videolan.org/vlc/3.0.21/win64/vlc-3.0.21-win64.exe"
}

Start-Process $VLCPath
