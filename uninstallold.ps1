remove-printer "main*"
remove-printer "kyocera*"
Start-Sleep -Seconds 10
remove-printerPort -Name "IP_192.168.81.250*"
remove-printerPort -Name "IP_192.168.81.250"