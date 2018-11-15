#! /bin/bash
echo "[Start Update Ark]"
cd ~/Ark/
./steamcmd.sh +force_install_dir ~/Ark/Serverfiles +login anonymous +app_update 376030 validate +quit
echo "[done]"
