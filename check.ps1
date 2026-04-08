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

# Path to Downloads
$Downloads = [Environment]::GetFolderPath("UserProfile") + "\Downloads"
$WinrarSetup = "$Downloads\winrar.exe"

# Check WinRAR
if (Test-Installed "WinRAR") {

    Write-Host "WinRAR is installed." -ForegroundColor Green

    if (Test-Path $WinrarSetup) {
        Remove-Item $WinrarSetup -Force
        Write-Host "Deleted winrar.exe from Downloads." -ForegroundColor Yellow
    }
    else {
        Write-Host "winrar.exe not found in Downloads." -ForegroundColor Gray
    }

}
else {
    Write-Host "WinRAR is NOT installed." -ForegroundColor Red
}
