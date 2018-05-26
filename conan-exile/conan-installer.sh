# Conan Installer v 1.0
#
# CC-BY Joyki
#
if [ `echo -n $USER` != "root" ]
then
echo ""
echo -e "\e[1;31m"
echo "[ERROR]: start as root"
echo -e "\e[0m"
echo ""
exit 1
fi
#
sleep 1
echo ""
echo -e "\e[1;33m"
echo "[INST_1]: APT Update & Upgrade"
echo -e "\e[0m"
apt-get update
apt-get upgrade -y
sleep 1
echo ""
echo -e "\e[1;33m"
echo "[INST_2]: Install Packages"
echo -e "\e[0m"
apt-get install xorg-dev libx11-dev libfreetype6-dev libxml2-dev libxslt1-dev make flex bison lib32gcc1 curl screen ca-certificates build-essential -y
sleep 1
echo ""
echo -e "\e[1;33m"
echo "[INST_3]: Download Wine 3.0"
echo -e "\e[0m"
wget https://dl.winehq.org/wine/source/3.0/wine-3.0.tar.xz
tar xvfJ wine-3.0.tar.xz -C /usr/src/ 
sleep 1
echo ""
echo -e "\e[1;33m"
echo "[INST_4]: Configure Wine 3.0"
echo -e "\e[0m"
cd /usr/src/wine-3.0/
./configure --with-png --enable-win64
sleep 1
echo ""
echo -e "\e[1;33m"
echo "[INST_5]: Compile Wine 3.0"
echo -e "\e[0m"
cpux=$(cat /proc/cpuinfo | grep processor | wc -l)
make -j $cpux
make install 
sleep 1
echo ""
echo -e "\e[1;33m"
echo "[INST_6]: Download Files"
echo -e "\e[0m"
cd ~
mkdir Conan
cd Conan
curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
./steamcmd.sh +@sSteamCmdForcePlatformType windows +force_install_dir ~/Conan/Serverfiles +login anonymous +app_update 443030 validate +quit 
sleep 1
echo ""
echo -e "\e[1;32m"
echo "[DONE]: Install is done"
echo ""
echo ""
echo " To start the Server, type:"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo ""
echo "screen"
echo "cd ~/Conan/Serverfiles"
echo "/usr/src/wine-3.0/wine ConanSandboxServer.exe -log"
echo ""
echo " Have fun ! "
echo -e "\e[0m"
echo ""
