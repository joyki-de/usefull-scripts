echo "[INFO] Stop RocketChat-Service"
systemctl stop rocketchat.service
sleep 3
echo "[INFO] Remove old Files"
sleep 1
rm rocket.chat.tgz
echo "[INFO] Download new Files"
sleep 1
curl -L https://releases.rocket.chat/latest/download -o rocket.chat.tgz
echo "[INFO] Extract Files"
sleep 1
tar zxvf rocket.chat.tgz
echo "[INFO] Install"
sleep 1
rm Rocket.Chat -r
mv bundle Rocket.Chat
cd Rocket.Chat/programs/server
npm install
sleep 2
cd ../..
echo "[INFO] Start RocketChat-Service"
systemctl start rocketchat.service
sleep 3
echo "[INFO] Done"

