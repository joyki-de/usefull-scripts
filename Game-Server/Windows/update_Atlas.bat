@echo off
TITLE UPDATE ATLAS
C:\STEAM\steamcmd\steamcmd.exe +login anonymous +force_install_dir ./ATLAS/ +app_update 1006030 validate +quit
exit
