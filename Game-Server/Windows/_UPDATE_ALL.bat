@echo off
TITLE AUTO-UPDATER
echo.
echo Auto-Updater active
echo.
TIMEOUT /T 5 /NOBREAK
echo.
echo Update Ark...
TIMEOUT /T 10
echo.
start /wait update_ARK.bat
echo.
Echo Done
echo.
echo Update Atlas...
TIMEOUT /T 10
echo.
start /wait update_Atlas.bat
echo.
Echo Done
echo.
echo Update Conan Exiles...
TIMEOUT /T 10
echo.
start /wait update_CONAN.bat
echo.
Echo Done
echo.
echo Update Dark n Light...
TIMEOUT /T 10
echo.
start /wait update_DNL.bat
echo.
Echo Done
echo.
echo Update Forest...
TIMEOUT /T 10
echo.
start /wait update_FOREST.bat
echo.
Echo Done
echo.
echo Update Space Engineers...
TIMEOUT /T 10
echo.
start /wait update_SE.bat
echo.
Echo All Done
echo.
Pause
