Show-Step "Installing VLC Player..."

$VLCPath = "$env:TEMP\vlc.exe"

# Download installer
Invoke-WebRequest -Uri "https://get.videolan.org/vlc/3.0.21/win64/vlc-3.0.21-win64.exe" `
    -OutFile $VLCPath

# Kill VLC if running (IMPORTANT)
Get-Process vlc -ErrorAction SilentlyContinue | Stop-Process -Force

# Install silently
Start-Process $VLCPath -ArgumentList "/S" -Wait

Show-Done "VLC Player Installed"
