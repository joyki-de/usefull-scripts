# Conan Scripter v1.1
#
# CC-BY Joyki
#
#! /bin/bash
updater="conan-update.sh"
starter="conan-start.sh"
checker="conan-check.sh"
if [ -f "$updater" ]
then
echo  "[Updater] exists"
else
cd ~
touch conan-update.sh
echo '#! /bin/bash
echo "[Start Update Conan]"
cd ~/Conan/
./steamcmd.sh +@sSteamCmdForcePlatformType windows +force_install_dir Conan/Serverfiles +login anonymous +app_update 443030 validate +quit
echo "[done]"' > $updater
chmod +x conan-update.sh
echo  "[Updater] created"
fi
if [ -f "$starter" ]
then
echo  "[Starter] exists"
else
cd ~
touch conan-start.sh
echo '#! /bin/bash
cd ~/Conan/Serverfiles
screen -dmS Conan /usr/src/wine-3.0/wine ConanSandboxServer.exe -log ' >$starter
chmod +x conan-start.sh
echo  "[Starter] created"
fi
if [ -f "$checker" ]
then
echo  "[Checker] exists"
else
cd ~
touch conan-check.sh
echo '#! /bin/bash
case "$(pidof Conan | wc -w)" in
0)
~/conan-start.sh
;;
1)
;;
esac' > $checker
chmod +x conan-check.sh
echo  "[Checker] created"
fi

