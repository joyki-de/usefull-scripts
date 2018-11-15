# ARK Scripter v1.0
#
# CC-BY Joyki
#
#! /bin/bash
updater="ark-update.sh"
starter="ark-start.sh"
checker="ark-check.sh"
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
screen -dmS Ark /ShooterGame/Binaries/Linux/ShooterGameServer TheIsland?listen?SessionName=SERVERNAME -server -log ' >$starter
chmod +x ark-start.sh
echo  "[Starter] created"
fi
if [ -f "$checker" ]
then
echo  "[Checker] exists"
else
cd ~
touch ark-check.sh
echo '#! /bin/bash
case "$(pidof Ark | wc -w)" in
0)
~/ark-start.sh
;;
1)
;;
esac' > $checker
chmod +x ark-check.sh
echo  "[Checker] created"
fi

