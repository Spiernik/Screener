@echo off
cls
ECHO ADB Dumper 0.0.1 
ECHO Copyright by Stepan

::echo [101;93m
:: Displays Ascii art
::type .\ressources\art
::echo [0m

::Starte den ADB Server
ECHO [1;4mStarte ADB-Server[0m
ECHO.
.\ressources\adb.exe kill-server
::Sleep um auf adb zu warten
@ping -n 2 localhost> nul
.\ressources\adb.exe start-server
ECHO.

::ADB Geräte ausgeben
ECHO [1;4mADB-Geraete:[0m
ECHO.
.\ressources\adb.exe devices -l


ECHO Modellbezeichnung:
.\ressources\adb.exe shell getprop > .\temp
findstr product.model .\temp
del /f .\temp
ECHO.

::Name eingeben
ECHO [1;4mBitte Sicherungsname eingeben.[0m
ECHO.
set /P id=Sicherungsname:

::Datum erfassen
set d=%date%
set SORTDATE=%d:~-4%-%d:~3,2%-%d:~0,2%

::Zeit Erfassen
set t=%time%
set SORTTIME=%t:~0,2%%t:~3,2%%t:~6,2%
if "%SORTTIME:~0,1%"==" " set SORTTIME=0%SORTTIME:~1,6%

::Erstelle den Ordner
set idDir=%id%-%SORTDATE%-%SORTTIME%
MKDIR %idDir%
ECHO.



:END
::Kille ADB Server
.\ressources\adb.exe kill-server
ECHO TWRP-Dumper abgeschlossen.
pause >NUL