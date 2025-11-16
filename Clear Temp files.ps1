# Check if the script is running with administrator privileges
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

# If not running as admin, relaunch the script with elevated privileges
if (-not $isAdmin) {
    Write-Host "Restarting script with elevated privileges..."
    Start-Process powershell.exe -Verb RunAs -ArgumentList "-File $($MyInvocation.MyCommand.Path)"
}

# Script continues with elevated privileges from this point onwards

# Clear temporary files from common locations
$tempDirectories = @(
    "$env:TEMP",
    "$env:LOCALAPPDATA\Temp",
    "$env:USERPROFILE\AppData\Local\Temp"
)

# Loop through each directory and remove files
foreach ($directory in $tempDirectories) {
    try {
        Get-ChildItem -Path $directory -Force | Where-Object {!$_.PSIsContainer} | Remove-Item -Force -ErrorAction SilentlyContinue
        Write-Host "Temporary files in $directory cleared."
    }
    catch {
        Write-Host "Failed to clear temporary files in $($directory): $($_.Exception.Message)"
    }
}

Write-Host "Temporary files cleared."
