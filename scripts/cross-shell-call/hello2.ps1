
# 使用 参数绑定（参数名）
param(
    [Parameter(Mandatory=$true)]
    [string]$first,

    [Parameter(Mandatory=$false)]
    [string]$second = "bird"
)

Write-Output "hello2 powershell"
Write-Host "first=$first, second=$second"
# == file, run in current shell ==
# ./hello2.ps1 -first "apple" -second "banana" 

# == file, run in new shell ==
# return to current shell
# powershell -File hello2.ps1 -first "apple" -second "banana"
# => first=apple, second=banana
