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
$officeFile = ".\Office2013Setup.exe"

if (-Not (Test-Path $officeFile)) {
    Write-Host "[INFO] Office 2013 installer not found." -ForegroundColor Cyan
    Write-Host "Please download Office 2013 Home & Student 32-bit manually from your website." -ForegroundColor Yellow
    Write-Host "Once downloaded, place the 'Office2013Setup.exe' file in the same folder as this script and re-run." -ForegroundColor Yellow

    # Open the website in default browser
    Start-Process "https://massgrave.dev/genuine-installation-media" 
    exit
} else {
    Write-Host "[INSTALLING] Office 2013..." -ForegroundColor Yellow
    Start-Process $officeFile -ArgumentList "/quiet" -Wait
    Write-Host "[DONE] Office 2013 installed." -ForegroundColor Green
}


Write-Host ""
Write-Host "ALL TASKS COMPLETED!" -ForegroundColor Cyan
