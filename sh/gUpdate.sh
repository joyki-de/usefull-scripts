#WIP

#!/bin/bash
#
# check root
if [ `echo -n $USER` != "root" ]
then
dialog --title 'WICHTIG!' --msgbox ' Bitte als ROOT starten ' 5 20
exit 1
fi

dialog --title 'Phase 1' -- gauge 'Update' 0 0


sleep 1
echo "*** Phase 1 : Update"
echo ""
apt-get update
echo ""
echo "*** Phase 2 : Upgrade"
echo ""
apt-get upgrade -y
echo ""
echo "*** Abgeschlossen"
echo ""
