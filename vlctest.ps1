Show-Step "Installing VLC Player..."
$VLCPath = "$Downloads\vlc.exe"

try {
    Start-Process "https://get.videolan.org/vlc/3.0.21/win64/vlc-3.0.21-win64.exe"
}
catch {
    Invoke-WebRequest -Uri "https://get.videolan.org/vlc/3.0.21/win64/vlc-3.0.21-win64.exe" `
        -OutFile $VLCPath `
        -Headers @{ "User-Agent" = "Mozilla/5.0" }
}

Start-Process $VLCPath
