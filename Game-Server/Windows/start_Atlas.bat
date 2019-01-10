@echo off
TITLE ATLAS-SERVER
start ""/NORMAL "C:\STEAM\steamcmd\atlas\ShooterGame\Binaries\Win64\Shootergameserver.exe" "Ocean?ServerX=0?ServerY=0?AltSaveDirectoryName=00?ServerAdminPassword=SECRET?MaxPlayers=64?ReservedPlayerSlots=25?QueryPort=57561?Port=5761" -log -server 
exit