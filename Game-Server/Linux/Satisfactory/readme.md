#ubuntu 22.x
adduser -m steam
apt update && apt upgrade -Y
apt install software-properties-common screen -Y
add-apt-repository multiverse -Y
apt update
apt install steamcmd -Y
su steam
steamcmd +force_install_dir ~/satisfactory +login anonymous +app_update 1690800 -beta public validate +quit
