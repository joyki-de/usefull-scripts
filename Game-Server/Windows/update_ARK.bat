@echo off
TITLE UPDATE ARK
C:\STEAM\steamcmd\steamcmd.exe +login anonymous +force_install_dir ./ARK/ +app_update 376030 validate +quit
exit