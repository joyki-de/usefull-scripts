#!/bin/bash
#
echo ""
echo "*** Initalisiere..."
echo ""
# check root
if [ `echo -n $USER` != "root" ]
then
echo " *** Fehler: Bitte als root starten"
echo ""
exit 1
fi
sleep 1
echo "*** Phase 1 : Update"
echo ""
apt-get update
echo ""
echo "*** Phase 2 : Installation"
echo ""
apt-get install sshguard -y
echo ""
echo "*** Abgeschlossen"
echo ""
