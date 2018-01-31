#!/bin/bash
#
VERSION="1.0"
echo ""
# check root
if [ `echo -n $USER` != "root" ]
then
echo "Fehler: Bitte als root starten"
echo ""
exit 1
fi

echo Beende nginx...
wait 1
service nginx stop
echo ...
echo Erledigt
echo ...
echo Update certificate
cd /home/pi/LetsEncrypt/letsencrypt

#Pfad anpassen

./certbot-auto renew
echo Fertig !
wait 1
echo ...
echo Starte wieder nginx
service nginx start
echo ...
echo Fertig !
wait 3

exit 1
