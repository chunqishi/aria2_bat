@echo off

set http_proxy=http://165.225.96.34:10015
set https_proxy=http://165.225.96.34:10015

set BAT_HOME=%~dp0
set PASTE_EXE=%BAT_HOME%\paste.exe
set DOWNLOAD_HOME=%HOMEPATH%\Downloads
set SHORT_CUT=%USERPROFILE%\Desktop\Aria2.lnk
If Not Exist %SHORT_CUT% %BAT_HOME%\XXMKLINK.EXE %USERPROFILE%\Desktop\Aria2 %BAT_HOME%\aria2.bat "" %BAT_HOME% Aria2 3 %BAT_HOME%\aria2.ico

CD %DOWNLOAD_HOME%

REM　http://ss64.com/nt/for_cmd.html

for /f "tokens=*" %%a in ('%PASTE_EXE%') do (
	echo Downloading %%a ...
	aria2c -s 20 -x 16 "%%a"
)


start %DOWNLOAD_HOME%
pause