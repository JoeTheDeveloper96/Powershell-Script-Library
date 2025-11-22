# ============================================
# Silent Winget Updater Script
# Updates all applications quietly
# ============================================

# Check for Administrator privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Restarting script with admin rights..."
    Start-Process powershell "-NoLogo -NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# Optional: Create a log directory
$LogPath = "$env:ProgramData\WingetUpdate\winget-update.log"
New-Item -ItemType Directory -Path (Split-Path $LogPath) -Force | Out-Null

Write-Host "Starting silent application updates..."
Write-Host "Logging to: $LogPath"

# Winget upgrade command
$command = 'winget upgrade --all --include-unknown --silent --accept-package-agreements --accept-source-agreements'

# Run and log output
Invoke-Expression $command 2>&1 | Tee-Object -FilePath $LogPath

Write-Host "Updates complete."
