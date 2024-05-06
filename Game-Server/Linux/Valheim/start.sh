#!/bin/bash
# Valheim Serverstarter
export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970
./valheim_server.x86_64 -name $1 -port 2456 -world $2 -password $3 -crossplay
export LD_LIBRARY_PATH=$templdpath

