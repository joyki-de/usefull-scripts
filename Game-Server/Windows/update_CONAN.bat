@echo off
TITLE UPDATE CONAN
C:\STEAM\steamcmd\steamcmd.exe +login anonymous +force_install_dir ./CONAN/ +app_update 443030 validate +quit
exit