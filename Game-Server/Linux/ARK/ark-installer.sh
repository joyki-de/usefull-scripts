#!/bin/bash
#
# Ark Installer v1.0
#
# CC-BY Joyki
#
echo ""
echo "ARK-Server Installer"
echo ""
PS3='Please choose: '
options=("Install Requ.(root/sudo need!)" "Install Steam" "Create Scripts" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Install Requ.(root/sudo need!)")
            echo "Install Requirements"
# Safemode /on
#sudo apt-get update 
#sudo apt-get upgrade -y 
#
#
echo "Done"
echo ""

            ;;
        "Install Steam")
            echo "Install Steam-Client"
# Safemode /on
# cd ~
#mkdir Ark
#cd Ark
#curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
echo "Done"
echo ""

            ;;
        "Create Scripts")
            echo "Create Scripts"
# Safemode /on


echo "Done"
echo ""
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
