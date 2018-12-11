@echo off
TITLE DNL-SERVER
cd C:\STEAM\steamcmd\dnl\DNL\Binaries\Win64
start ""/NORMAL "C:\STEAM\steamcmd\dnl\DNL\Binaries\Win64\DNLServer.exe" "/Game/DNL/Maps/CapeOfSacredPath/DNL_ALL?Port=7777?QueryPort=27015?SessionName=SERVERNAME?MaxPlayers=20?listen" -servergamelog -useallavailablecores -nosteamclient -game -server -log
exit