Write-Host ""
Write-Host ""
Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host "     BASIC SOFTWARE INSTALLER PC/LAPTOP BY ADAM     " -ForegroundColor Cyan
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""


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
# WINRAR
# =========================
Show-Step "Downloading WinRAR setup file..."
$winrarPath = "$Downloads\winrar.exe"

Start-BitsTransfer -Source "https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-720.exe" -Destination $winrarPath
Start-Process $winrarPath

Show-Done "WinRAR setup file downloaded and launched!"

# =========================
# GOOGLE CHROME
# =========================
Show-Step "Downloading Google Chrome setup file..."
$chromePath = "$Downloads\chrome.exe"

Start-BitsTransfer -Source "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -Destination $chromePath
Start-Process $chromePath

Show-Done "Google Chrome setup file downloaded and launched!"

# =========================
# OFFICE 
# =========================
$OfficePath = "$Downloads\office.exe"

try {
    $choice = ""
    Write-Host "Select OFFICE 64x to download!"
    Write-Host "1)Office2021"
    Write-Host "2)Office2024"
    Write-Host "3)Microsoft365"
    $choice = Read-Host"Enter your choice [1,2,3] :`n"
    
    if ($choice -eq "1"){
      Show-Step "Downloading Office 2021 setup file.."
      Start-BitTransfer -Source "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=ProPlus2021Retail&platform=x64&language=en-us&version=O16GA" -Destination $OfficePath
      
    }
    elseif($choice -eq "2"){
      Show-Step "Downloading Office 2024 setup file.."
      Start-BitTransfer -Source "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=ProPlus2024Retail&platform=x64&language=en-us&version=O16GA" -Destination $OfficePath
      
    }
    elseif($choice -eq "3"){
      Show-Step "Downloading Microsoft365 setup file.."
      Start-BitTransfer -Source "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=O365ProPlusRetail&platform=x64&language=en-us&version=O16GA" -Destination $OfficePath
      
    }

    Start-Process $OfficePath

    Show-Done "Office Setup Downloaded and Launched!"
}
catch {
    Start-Process "https://massgrave.dev/office_c2r_links"
}

irm https://get.activated.win | iex

Write-Host "===============================================" -ForegroundColor Cyan
Write-Host "        DOWNLOAD COMPLETED                     " -ForegroundColor Cyan
Write-Host "===============================================" -ForegroundColor Cyan





