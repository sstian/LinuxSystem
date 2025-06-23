@echo off
echo killing the process running insomnia.vbs...

taskkill /FI "imagename eq wscript.exe" /F
taskkill /FI "imagename eq cscript.exe" /F

echo done.
