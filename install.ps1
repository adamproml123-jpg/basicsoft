# ==========================================
# BASIC SOFTWARE AUTO INSTALLER (POWERSHELL)
# ==========================================

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "   BASIC SOFTWARE AUTO INSTALLER" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# Function for install
function Install-App {
    param ($name, $id)

    Write-Host "[INSTALLING] $name..." -ForegroundColor Yellow
    winget install $id -e --silent --accept-package-agreements --accept-source-agreements
    Write-Host "[DONE] $name" -ForegroundColor Green
    Write-Host ""
}

# Install apps
Install-App "Google Chrome" "Google.Chrome"
Install-App "WinRAR" "RARLab.WinRAR"
Install-App "VLC Player" "VideoLAN.VLC"

#Office 2013 installation
# ==============================
# Google Drive large file downloader
# ==============================

$FileId = "1fA7o9ix8MUHWhsBH7N41YtH9tYt5OT2p"
$Destination = "$env:TEMP\Office2013Setup.exe"

Write-Host "[INFO] Downloading Office 2013 from Google Drive..." -ForegroundColor Cyan

# Create web session to handle cookies
$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession

# Initial request (Google may require confirmation for large files)
$initial = Invoke-WebRequest -Uri "https://drive.google.com/uc?export=download&id=$FileId" -WebSession $session

# Check if a confirm token is required
if ($initial.Content -match "confirm=([0-9A-Za-z_]+)&") {
    $confirm = $matches[1]
    $downloadUrl = "https://drive.google.com/uc?export=download&confirm=$confirm&id=$FileId"
    Invoke-WebRequest -Uri $downloadUrl -OutFile $Destination -WebSession $session -UseBasicParsing
} else {
    # No confirmation needed
    Invoke-WebRequest -Uri "https://drive.google.com/uc?export=download&id=$FileId" -OutFile $Destination -WebSession $session -UseBasicParsing
}

Write-Host "[INFO] Download complete. Starting installer..." -ForegroundColor Green

# Start Office installer silently
Start-Process $Destination -ArgumentList "/quiet" -Wait

Write-Host "[DONE] Office 2013 installation finished." -ForegroundColor Cyan

Write-Host "[DONE] Office 2013 Installed" -ForegroundColor Green

Write-Host ""
Write-Host "ALL TASKS COMPLETED!" -ForegroundColor Cyan
