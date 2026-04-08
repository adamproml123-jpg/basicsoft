# ==========================================
# DELETE DOWNLOADS + EMPTY RECYCLE BIN
# ==========================================

Write-Host "Cleaning Downloads folder..." -ForegroundColor Yellow

$Downloads = "$env:USERPROFILE\Downloads"

if (Test-Path $Downloads) {
    Get-ChildItem -Path $Downloads -Recurse -Force | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
    Write-Host "Downloads cleaned." -ForegroundColor Green
} else {
    Write-Host "Downloads folder not found." -ForegroundColor Red
}

Write-Host ""
Write-Host "Emptying Recycle Bin..." -ForegroundColor Yellow

try {
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
    Write-Host "Recycle Bin emptied." -ForegroundColor Green
} catch {
    Write-Host "Failed to empty Recycle Bin." -ForegroundColor Red
}

Write-Host ""
Write-Host "Done." -ForegroundColor Cyan
Pause
