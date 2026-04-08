# Header
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host "     BASIC SOFTWARE AUTO INSTALLER BY ADAM     " -ForegroundColor Cyan
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

# Set Downloads folder
$Downloads = "$env:USERPROFILE\Downloads"

function Show-Step {
    param ($message)
    Write-Host ">> $message" -ForegroundColor Yellow
}

function Show-Done {
    param ($message)
    Write-Host "[DONE] $message" -ForegroundColor Green
    Write-Host ""
}

# =========================
# VLC PLAYER
# =========================
Show-Step "Installing VLC Player..."
$VLCPath = "$Downloads\vlc-3.0.23-win64.exe"

try {
    Start-BitsTransfer -Source "https://get.videolan.org/vlc/3.0.21/win64/vlc-3.0.21-win64.exe" -Destination $VLCPath
}
catch {
    Invoke-WebRequest -Uri "https://get.videolan.org/vlc/3.0.21/win64/vlc-3.0.21-win64.exe" `
        -OutFile $VLCPath `
        -Headers @{ "User-Agent" = "Mozilla/5.0" }
}

Start-Process $VLCPath -Wait

Show-Done "VLC Player Installed"
# =========================
# WINRAR
# =========================
Show-Step "Installing WinRAR..."
$winrarPath = "$Downloads\winrar.exe"

Start-BitsTransfer -Source "https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-720.exe" -Destination $winrarPath
Start-Process $winrarPath

Show-Done "WinRAR Installed"

# =========================
# GOOGLE CHROME
# =========================
Show-Step "Installing Google Chrome..."
$chromePath = "$Downloads\chrome.exe"

Start-BitsTransfer -Source "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -Destination $chromePath
Start-Process $chromePath

Show-Done "Google Chrome Installed"

# =========================
# OFFICE 2013
# =========================
Show-Step "Installing Office 2013..."
$OfficePath = "$Downloads\office2013.exe"

try {
    Start-BitsTransfer -Source "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=HomeStudentRetail&platform=x86&language=en-us&version=O15GA" -Destination $OfficePath
}
catch {
    Start-Process "https://massgrave.dev/office_c2r_links"
}

Start-Process $OfficePath

Show-Done "Office 2013 Setup Launched"

# =========================
# KEYBINDS / DRIVERS
# =========================
Show-Step "Installing Brightness & Volume Keybinds..."
$cpp = "$Downloads\cpp.exe"
$ec = "$Downloads\ec.exe"

try {
    Start-BitsTransfer -Source "https://aka.ms/vs/17/release/vc_redist.x64.exe" -Destination $cpp
    Start-BitsTransfer -Source "https://github.com/coolstar/driverinstallers/raw/master/crosec/crosec.2.0.7-installer.exe" -Destination $ec
}
catch {
    Start-Process "https://coolstar.org/chromebook/windows-install.html"
}

Start-Process $cpp -Wait
Start-Process $ec

Show-Done "Keybind Drivers Installed"

# =========================
# FINISH
# =========================
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host "        ALL TASKS COMPLETED (LAUNCHED)         " -ForegroundColor Cyan
Write-Host "===============================================" -ForegroundColor Cyan
