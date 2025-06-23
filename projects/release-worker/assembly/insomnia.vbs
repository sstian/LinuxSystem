dim i 
i = 0
do while (i <= 720)
  UTI_SENDKEYS("{SCROLLLOCK}")
  i = i + 1
loop

function UTI_SENDKEYS(ByVal sKey)
  set WshShell = CreateObject("WScript.Shell")
  WshShell.SendKeys sKey
  WScript.sleep 60000
  set WshShell = nothing
end function
