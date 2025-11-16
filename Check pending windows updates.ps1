# Windows Update Status
$updateSession = New-Object -ComObject Microsoft.Update.Session
$updateSearcher = $updateSession.CreateUpdateSearcher()
$updates = $updateSearcher.Search("IsInstalled=0")

if ($updates.Count -gt 0) {
    Write-Host "Updates Available!"
} else {
    Write-Host "No Updates Available"
}
# Pause to keep the window open
Write-Host "Press Enter to exit."
Read-Host