# Get service status
$services = Get-Service | Where-Object { $_.Status -eq "Running" }

# Display service status
foreach ($service in $services) {
    $serviceName = $service.Name
    $serviceStatus = $service.Status
    $test = $service.CanStop
    Write-Output "Service $serviceName Status: $serviceStatus test: $test"
}