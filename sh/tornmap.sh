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
        while true
        do
                echo ""
                echo "TOR NMAP Version ${VERSION}"
                echo ""
                echo -n "Ziel-IP eingeben:  "
                read -e ZIELIP
#                echo -n "Ziel-Port:            "
#                read -e ZIELPORT
                echo ""
                echo -n " > TOR Scan auf die IP ${ZIELIP} durchführen? "
                read -e CONFIRM
                case $CONFIRM in
                        y|Y|YES|yes|Yes|j|J|ja|Ja)
                                break ;;
                        *) echo "Bitte Daten neu eingeben"
                esac
        done
proxychains nmap -sT -PN -n -sV ${ZIELIP}
echo ""
exit 1
