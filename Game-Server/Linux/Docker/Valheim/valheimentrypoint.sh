#!/bin/bash -ex

[ "$UID" != 0 ] || {
    mkdir -p ~user/Steam
    chown user: ~user/Steam
    runuser -u user "$0" "$@"
    exit 0
}

GAMEDIR="$HOME/Steam/steamapps/common/Valheim"

cd "$HOME"
STEAMCMD="./steamcmd.sh +login anonymous $STEAMCMD"

# eval to support quotes in $STEAMCMD
eval "$STEAMCMD +app_update  896660 +quit"

mkdir -p "$GAMEDIR/Logs"

#rm -f /tmp/.X1-lock
#Xvfb :1 -screen 0 800x600x24 &
#export WINEDLLOVERRIDES="mscoree,mshtml="
#export DISPLAY=:1

cd "$GAMEDIR"

[ "$1" = "bash" ] && exec "$@"

sh -c 'until [ "`netstat -ntl | tail -n+3`" ]; do sleep 1; done
sleep 5 # gotta wait for it to open a logfile
tail -F Logs/current.log ../Logs/*/*.log 2>/dev/null' &
export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970
./valheim_server.x86_64 -name "Servername" -world "AnyWorld"  -password "AnyPass" -public 1
export LD_LIBRARY_PATH=$templdpath

