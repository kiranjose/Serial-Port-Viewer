::This bat file lists the serial ports
::Author kiran jose / www.kiranjose.com

::to not show what command it’s executing
ECHO OFF
CLS
::window title
TITLE  Terminal
 

 ECHO Simple Serial port Viewer by Kiran Jose @ www.kiranjose.com
 ECHO --------------------------------------------------------------------------
 ECHO Available Communication ports list
 echo.
 ::lists com ports
 ::mode.com
mode.com | find "COM" > serialports.txt

::serach and replace string "Status for device" in serialports.txt
call searchnreplace.bat "Status for device" "" serialports.txt > serialportstmp.txt

::serach and replace string ":" in serialportstmp.txt
call searchnreplace.bat ":" "" serialportstmp.txt > serialports.txt 

::search "COM" in serialportst.txt
FINDSTR "COM" serialports.txt

::delete temp files
del serialportstmp.txt
del serialports.txt

:: null check
set RESULT1=%ERRORLEVEL%
if %RESULT1%==0 ( 
 echo.
 ECHO --------------------------------------------------------------------------
 pause
) else ( 
 echo None :-( 
 echo --------------------------------------------------------------------------
 pause

)


 