

$thehost = $(hostname)
$thehostUpper = $thehost.ToUpper()
Write-Output "thehostUpper = $thehostUpper"

switch ($thehostUpper) {
  "AAA" {
    Write-Output "I am on server AAA"
    Write-Output "reg.exe import - Command Result:"

    cmd /c "reg.exe import D:\test.reg"

    break
  }

   default {
    Write-Output "Server nam not recognized. No registry imports performed."
    break
  }
}

Write-Output "done."
