Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "   BASIC SOFTWARE AUTO INSTALLER BY ADAM" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

#Winrar
Write-Host "[INSTALLING] WinRAR..." -ForegroundColor Yellow
Invoke-WebRequest -Uri "https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-720.exe" -OutFile "$env:TEMP\winrar.exe"
Start-Process "$env:TEMP\winrar.exe" 
Write-Host "[DONE] WinRAR" -ForegroundColor Green

#Chrome
Invoke-WebRequest -Uri "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -OutFile "$env:TEMP\chrome.exe"
Start-Process "$env:TEMP\chrome.exe"
Write-Host "[DONE] Google Chrome" -ForegroundColor Green

#vlc
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
$OfficePath = "$env:TEMP\office2013.exe"

try {
    Start-BitsTransfer -Source "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=HomeStudentRetail&platform=x86&language=en-us&version=O15GA" -Destination $OfficePath
}
catch {
    Start-Process "https://massgrave.dev/office_c2r_links"
}

Start-Process $OfficePath 
Write-Host "[DONE] Office 2013" -ForegroundColor Green
