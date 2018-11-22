#!/bin/bash
#
# Ark Installer v1.2
#
# CC-BY Joyki
#
echo ""
echo "ARK-Server Installer"
echo ""
PS3='Please choose: '
options=("Install Requirements" "Install Server" "Create Scripts" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Install Requirements")
            echo "Install Requirements, please wait..."
sudo apt-get update 
sudo apt-get upgrade -y 
apt-get install lib32gcc1 curl screen ca-certificates libc6-dev build-essential -y
echo "Done"
echo ""

            ;;
        "Install Server")
            echo "Install Steam-Client, please wait"
cd ~
mkdir Ark
cd Ark
curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
echo ""
echo "Install Server"
echo ""
 ./steamcmd.sh +force_install_dir ~/Ark/Serverfiles +login anonymous +app_update 376030 validate +quit
echo "Done"
echo ""
            ;;
        "Create Scripts")
            echo "Create Scripts"
starter="ark-start.sh"
updater="ark-update.sh"
if [ -f "$updater" ]
then
echo  "[Updater] exists"
else
cd ~
touch ark-update.sh
echo '#! /bin/bash
echo "[Start Update Ark]"
cd ~/Ark/
./steamcmd.sh +force_install_dir ~/Ark/Serverfiles +login anonymous +app_update 376030 validate +quit
echo "[done]"' > $updater
chmod +x ark-update.sh
echo  "[Updater] created"
fi
if [ -f "$starter" ]
then
echo  "[Starter] exists"
else
cd ~
touch ark-start.sh
echo '#! /bin/bash
cd ~/Ark/Serverfiles
screen -dmS Ark /ShooterGame/Binaries/Linux/ShooterGameServer TheIsland?listen?SessionName=SERVERNAME -server -log' >$starter
chmod +x ark-start.sh
echo  "[Starter] created"
fi
echo "Done"
echo ""
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
