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
$officeUrl = ""
$officeFile = "$env:TEMP\Office2013Setup.exe"

Write-Host "[DOWNLOADING] Office 2013..." -ForegroundColor Yellow
Invoke-WebRequest $officeUrl -OutFile $officeFile

Write-Host "[INSTALLING] Office 2013..." -ForegroundColor Yellow
Start-Process $officeFile -ArgumentList "/quiet" -Wait

Write-Host "[DONE] Office 2013 Installed" -ForegroundColor Green

Write-Host ""
Write-Host "ALL TASKS COMPLETED!" -ForegroundColor Cyan
