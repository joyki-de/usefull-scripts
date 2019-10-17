#!/bin/bash
#
# Nexus-Server-Settings v1.0
#
# CC-BY Joyki
#
#
        while true
        do
                echo ""
                echo -n "Enter Server-Name:  "
                read -e SERVERNAME
                echo -n "Enter Server-IP:    "
                read -e SERVERIP
                echo ""
                echo -n " > Server-Name ${SERVERNAME} and Server-IP ${SERVERIP} correct? "
                read -e CONFIRM
                case $CONFIRM in
                        y|Y|YES|yes|Yes|j|J|ja|Ja)
                                break ;;
                        *) echo "Please enter again"
                esac
        done
mysql -v -u root -D nexus_forever_auth -e "INSERT INTO server (name, host, port, type) VALUES ('${SERVERNAME}', '${SERVERIP}', 24000, 0)$
echo ""
exit 1

