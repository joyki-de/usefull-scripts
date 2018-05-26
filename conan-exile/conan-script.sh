#! /bin/bash
updater="conan-update.sh"
starter="conan-start.sh"
checker="conan-check.sh"
if [ -f "$updater" ]
then
echo -e "[Updater] exists \xE2\x9C\x94"
else
cd ~
touch conan-update.sh
echo '#! /bin/bash
echo "[Start Update Conan]"
cd ~/Conan/
./steamcmd.sh +@sSteamCmdForcePlatformType windows +force_install_dir conan/Serverfiles +login anonymous +app_update 443030 validate +quit
echo "[done]"' > $updater
chmod +x conan-update.sh
echo -e "[Updater] created \xE2\x9C\x94"
fi
if [ -f "$starter" ]
then
echo -e "[Starter] exists \xE2\x9C\x94"
else
cd ~
touch conan-start.sh
echo '#! /bin/bash
cd ~/Conan/Serverfiles
screen -dmS Conan /usr/src/wine-3.0/wine ConanSandboxServer.exe -log ' >$starter
chmod +x conan-start.sh
echo -e "[Starter] created \xE2\x9C\x94"
fi
if [ -f "$checker" ]
then
echo -e "[Checker] exists \xE2\x9C\x94"
else
cd ~
touch conan-check.sh
echo '#! /bin/bash
case "$(pidof Conan | wc -w)" in
0)
conan-start.sh
;;
1)
;;
esac' > $checker
chmod +x conan-check.sh
echo -e "[Checker] created \xE2\x9C\x94"
fi

