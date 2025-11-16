# Network Configuration
$networkInfo = Get-WmiObject Win32_NetworkAdapterConfiguration | Where-Object { $_.IPAddress -ne $null }

foreach ($adapter in $networkInfo) {
    Write-Host "Adapter: $($adapter.Description)"
    Write-Host "IP Address: $($adapter.IPAddress)"
    Write-Host "Subnet Mask: $($adapter.IPSubnet)"
    Write-Host "Default Gateway: $($adapter.DefaultIPGateway)"
    Write-Host "DNS Servers: $($adapter.DNSServerSearchOrder)"
    Write-Host ""
}