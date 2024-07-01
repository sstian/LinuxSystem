
@echo off
echo "hello cmd"

:: == command, run in current shell ==
tree

echo %0 %1 %2
:: == file, run in current shell ==
:: hello.bat apple banana
:: => hello.bat apple banana

:: == command, run in new shell ==
:: cmd /c tree /F /A || cmd /c "tree /F /A"

:: == file, run in new shell ==
:: /c return to current shell; /k keep in new shell
:: cmd /c hello.bat apple banana || cmd /c "hello.bat apple banana"
:: cmd /k hello.bat apple banana || cmd /k "hello.bat apple banana"
