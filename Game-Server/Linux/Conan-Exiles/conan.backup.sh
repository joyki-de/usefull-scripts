#! /bin/bash
# Conan Backup v1.0
#
# CC-BY Joyki
#
#! /bin/bash
DATE=`date +%Y-%m-%d-%H-%M`
echo "[Info] Copy Data"
cd ~/Conan
mkdir Backup/$DATE
mkdir Backup/$DATE/ConanSandbox/
mkdir Backup/$DATE/ConanSandbox/Config/
mkdir Backup/$DATE/ConanSandbox/Saved/
mkdir Backup/$DATE/ConanSandbox/Saved/Config/
mkdir Backup/$DATE/ConanSandbox/Saved/Config/WindowsServer/
cp Serverfiles/ConanSandbox/Config/*.ini Backup/$DATE/ConanSandbox/Config/
cp Serverfiles/ConanSandbox/Saved/game* Backup/$DATE/ConanSandbox/Saved/
cp Serverfiles/ConanSandbox/Saved/Config/WindowsServer/*.ini Backup/$DATE/ConanSandbox/Saved/Config/WindowsServer/
echo "[Info] done"

