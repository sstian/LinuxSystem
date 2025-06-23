@echo off
set appname=test-app

set /p ver=< version
echo current version: %ver%

call check-version.bat %appname% %ver%
