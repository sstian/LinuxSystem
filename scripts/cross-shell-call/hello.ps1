
# echo "hello1 ps1"
Write-Output "hello powershell"

# == command, run in current shell ==
Get-Service | Where-Object {$_.Name -eq "WSearch"}

# 使用 $args 变量
Write-Host $args
foreach ($arg in $args) {
  Write-Host $arg
}
# == file, run in current shell ==
# ./hello.ps1 apple banana
#  => apple banana

# == command, run in new shell ==
# powershell / powershell.exe
# 执行单个cmdlet
# powershell.exe -Command "Get-Service | Where-Object {$_.Name -eq 'WSearch'}"
# 执行多个脚本
# powershell.exe -Command "& {Get-Process; Get-Service}"

# == file, run in new shell ==
# return to current shell
# powershell.exe -File hello.ps1 apple banana
#  => apple banana
# 绕过执行策略限制
# # powershell.exe -ExecutionPolicy Bypass -File "path\to\your-script.ps1"
