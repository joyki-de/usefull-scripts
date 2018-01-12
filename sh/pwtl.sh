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
                echo "pwtl Version ${VERSION}"
                echo ""
                echo -n "Quell-Port eingeben:  "
                read -e QUELLPORT
                echo -n "Ziel-IP eingeben:     "
                read -e ZIELIP
                echo -n "Ziel-Port:            "
                read -e ZIELPORT
                echo ""
                echo -n " > Eingehender Port ${QUELLPORT} an die IP ${ZIELIP} zu dem Port ${ZIELPORT} weiterleiten? "
                read -e CONFIRM
                case $CONFIRM in
                        y|Y|YES|yes|Yes|j|J|ja|Ja)
                                break ;;
                        *) echo "Bitte Daten neu eingeben"
                esac
        done
iptables -t nat -A PREROUTING -p tcp --dport ${QUELLPORT} -j DNAT --to-destination ${ZIELIP}:${ZIELPORT}
iptables -t nat -A POSTROUTING -p tcp --dport ${ZIELPORT} -j MASQUERADE
echo ""
exit 1
