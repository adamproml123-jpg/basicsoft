# ================================
# SOFTWARE CHECK SCRIPT
# ================================

function Test-Installed {
    param ($name)

    $paths = @(
        "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*",
        "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"
    )

    foreach ($path in $paths) {
        $app = Get-ItemProperty $path -ErrorAction SilentlyContinue |
               Where-Object { $_.DisplayName -like "*$name*" }

        if ($app) {
            return $true
        }
    }
    return $false
}

Write-Host "Checking installed software..." -ForegroundColor Cyan

$vlc     = Test-Installed "VLC"
$winrar  = Test-Installed "WinRAR"
$chrome  = Test-Installed "Google Chrome"
$office  = Test-Installed "Office 2013"
$vcredist= Test-Installed "Visual C++"

# Show results
Write-Host "VLC: $vlc"
Write-Host "WinRAR: $winrar"
Write-Host "Chrome: $chrome"
Write-Host "Office 2013: $office"
Write-Host "Visual C++: $vcredist"

# ================================
# CHECK ALL
# ================================

if ($vlc -and $winrar -and $chrome -and $office -and $vcredist) {

    Write-Host "`nAll software is installed. Running next commands..." -ForegroundColor Green

    # 👉 PUT YOUR NEXT COMMANDS HERE
    Write-Host "Running next step..."
    
    # Example:
    # Start-Process "notepad.exe"

}
else {
    Write-Host "`nSome software is missing!" -ForegroundColor Red

    if (-not $vlc)      { Write-Host "- VLC missing" }
    if (-not $winrar)   { Write-Host "- WinRAR missing" }
    if (-not $chrome)   { Write-Host "- Chrome missing" }
    if (-not $office)   { Write-Host "- Office 2013 missing" }
    if (-not $vcredist) { Write-Host "- Visual C++ missing" }
}
