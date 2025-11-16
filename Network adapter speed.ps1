Get-NetAdapter | Where-Object { $_.LinkSpeed -like '*mbps*' } | Select-Object Name, InterfaceDescription, Status, MacAddress, LinkSpeed
