# Check System Services Status
$servicesToCheck = @("wuauserv", "BITS", "Spooler")

foreach ($service in $servicesToCheck) {
    $serviceStatus = Get-Service -Name $service
    Write-Host "Service '$service' status: $($serviceStatus.Status)"
}
# Pause to keep the window open
Write-Host "Press Enter to exit."
Read-Host