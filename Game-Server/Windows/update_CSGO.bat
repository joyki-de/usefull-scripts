@echo off
TITLE UPDATE CS:GO
C:\STEAM\steamcmd\steamcmd.exe +login anonymous +force_install_dir ./CSGO/ +app_update 740 validate +quit
exit