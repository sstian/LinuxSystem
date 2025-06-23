
instance=test_service
cmdlet="Get-WmiObject win32_service | ? {\$_.Name -eq '${instance}'} | select Name, DisplayName, State, State, PathName >> output.txt"
powershell -c "${cmdlet}"
