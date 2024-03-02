# Satisfactory Prepare
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
echo "[PREP_01: Add User 'satisfactory']"
adduser -m satisfactory
sleep 1
echo ""
echo "[PREP_02]: APT Update & Upgrade"
apt-get update
apt-get upgrade -y
sleep 1
echo ""
echo "[PREP_03]: Install Packages"
apt install software-properties-common screen lsb-release wget -Y
sudo dpkg --add-architecture i386 -Y
add-apt-repository multiverse -Y
sudo apt-add-repository non-free -Y
apt update
apt-get upgrade -y
apt install steamcmd -Y