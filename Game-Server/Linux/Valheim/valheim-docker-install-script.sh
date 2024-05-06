# Valheim Installer Script for Dockerfiles
#
# CC-BY Joyki
#
apt-get update
apt-get upgrade -y
apt-get install lib32gcc-s1 curl screen ca-certificates libc6-dev build-essential -y




curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
./steamcmd.sh +force_install_dir ~/valheim/ +login anonymous +app_update 896660 validate +quit 


