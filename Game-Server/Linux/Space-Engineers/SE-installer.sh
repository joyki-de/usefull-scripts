### WIP !!!
# Space-Enigneers Installer v1.0
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
echo "[INFO]: Update & Install Packages"
apt update
apt upgrade -y
apt install gcc-multilib g++-multili winetricks -y 
echo "[INFO]: Download & Install Wine 1.755"
cd ~
mkdir wine1.7
cd wine1.7
wget https://dl.winehq.org/wine/source/1.7/wine-1.7.55.tar.bz2
tar jxf wine-1.7.55.tar.bz2
cd wine-1.7.55
./configure --without-x --without-freetype
cpux=$(cat /proc/cpuinfo | grep processor | wc -l)
make -j $cpux
make install 


cd ~
rm -rf ~/.wine
WINEARCH=win32 winecfg

winetricks -q msxml3
winetricks -q dotnet40
