# Run Disk Cleanup
Start-Process -FilePath "cleanmgr.exe" -ArgumentList "/sagerun:1" -Wait

# Remove temporary files
Remove-Item -Path "$env:TEMP\*" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:LOCALAPPDATA\Temp\*" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:USERPROFILE\AppData\Local\Temp\*" -Force -Recurse -ErrorAction SilentlyContinue

Write-Host "Disk cleanup and temporary files removed."

# Pause to keep the window open
Write-Host "Press Enter to exit."
Read-Host
