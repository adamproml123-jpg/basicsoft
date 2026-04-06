# ==========================================
# BASIC SOFTWARE AUTO INSTALLER (POWERSHELL)
# ==========================================

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "   BASIC SOFTWARE AUTO INSTALLER BY ADAM" -ForegroundColor Cyan
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

Write-Host ""
Write-Host "ALL TASKS COMPLETED!" -ForegroundColor Cyan
