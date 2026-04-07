Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "BASIC SOFTWARE AUTO INSTALLER BY ADAM" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

#Winrar
Write-Host "[INSTALLING] WinRAR..." -ForegroundColor Yellow
Invoke-WebRequest -Uri "https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-720.exe" -OutFile "$env:TEMP\winrar.exe"
Start-Process "$env:TEMP\winrar.exe" 
Write-Host "[DONE] WinRAR" -ForegroundColor Green

#Chrome
Write-Host "[INSTALLING] Google Chrome..." -ForegroundColor Yellow
Invoke-WebRequest -Uri "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -OutFile "$env:TEMP\chrome.exe"
Start-Process "$env:TEMP\chrome.exe"
Write-Host "[DONE] Google Chrome" -ForegroundColor Green

#vlc
Write-Host "[INSTALLING] VLC Player..." -ForegroundColor Yellow
$VLCPath = "$env:TEMP\vlc.exe"

try {
    Start-BitsTransfer -Source "https://get.videolan.org/vlc/3.0.21/win64/vlc-3.0.21-win64.exe" -Destination $VLCPath
}
catch {
    Invoke-WebRequest -Uri "https://get.videolan.org/vlc/3.0.21/win64/vlc-3.0.21-win64.exe" `
        -OutFile $VLCPath `
        -Headers @{ "User-Agent" = "Mozilla/5.0" }
}

Start-Process $VLCPath 
Write-Host "[DONE] VLC Player" -ForegroundColor Green

#Office 2013
Write-Host "[INSTALLING] Office 2013..." -ForegroundColor Yellow
$OfficePath = "$env:TEMP\office2013.exe"

try {
    Start-BitsTransfer -Source "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=HomeStudentRetail&platform=x86&language=en-us&version=O15GA" -Destination $OfficePath
}
catch {
    Start-Process "https://massgrave.dev/office_c2r_links"
}

Start-Process $OfficePath 
Write-Host "[DONE] Office 2013" -ForegroundColor Green

#Brightness and volume
Write-Host "[INSTALLING] Brightness n Volume keybinds..." -ForegroundColor Yellow
$cpp = "$env:TEMP\cpp.exe"
$ec = "$env:TEMP\ec.exe"

try {
    Start-BitsTransfer -Source "https://aka.ms/vs/17/release/vc_redist.x64.exe" -Destination $cpp
    Start-BitsTransfer -Source "https://github.com/coolstar/driverinstallers/raw/master/crosec/crosec.2.0.7-installer.exe" -Destination $ec
}
catch {
    Start-Process "https://massgrave.dev/office_c2r_links"
}

Start-Process $cpp 
Start-Process $ec 
Write-Host "[DONE] Keybinds" -ForegroundColor Green
