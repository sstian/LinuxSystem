@echo off
set appname=%1%
set ver=%2%

set timelabel=%TIME:~3,2%%TIME:~6,2%%TIME:~9,2%
echo timelabel(m+s+ms): %timelabel%

if not exist %appname% mkdir %appname% 

if exit %ver% (
  move %ver% %ver%_%timelabel%
)
mkdir %ver%
