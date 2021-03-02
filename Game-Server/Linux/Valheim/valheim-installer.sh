# Valheim Installer v1.0
#
# CC-BY Joyki
#
if [ `echo -n $USER` != "root" ]
then
echo ""
echo "[ERROR]: start as root"
echo ""
exit 1
fi
#
sleep 1
echo ""
echo "[INST_1]: APT Update & Upgrade"
apt-get update
apt-get upgrade -y
sleep 1
echo ""
echo "[INST_2]: Install Packages"
apt-get install lib32gcc1 curl screen ca-certificates libc6-dev build-essential -y
sleep 1
echo ""
echo "[INST_3]: Download Files"
cd ~
mkdir Valheim
cd Valheim
curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
./steamcmd.sh +force_install_dir ~/Valheim/ +login anonymous +app_update 896660 validate +quit 
sleep 1
echo ""
echo "[DONE]: Install is done"
echo ""
echo ""
echo " To start the Server, type:"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo ""
echo "screen"
echo "cd ~/Valheim"
echo ""
echo " Have fun ! "
echo ""
