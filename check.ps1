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

$winrar  = Test-Installed "WinRAR"


# ================================
# CHECK ALL
# ================================

if ($winrar) {

    Write-Host "Work"

}
else {
    Write-Host "`nSome software is missing!" -ForegroundColor Red

    
    if (-not $winrar)   { Write-Host "- WinRAR missing" }
    
}
