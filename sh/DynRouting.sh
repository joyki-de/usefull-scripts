#!/bin/bash
#
VERSION="1.0"
# check root
if [ `echo -n $USER` != "root" ]
then
echo "Fehler: Bitte als root starten"
echo ""
exit 1
URL=***ENTERURL***
ZIELIP=$(nslookup ${URL} | tail -2 | head -1 | awk '{print $2}')
# DELETE OLD ROUTING
for i in $( iptables -t nat --line-numbers -L | grep ^[0-9] | awk '{ print $1 }' | tac );
do iptables -t nat -D PREROUTING $i; done
# SET NEW ROUTING
iptables -t nat -A PREROUTING -p tcp --dport 27016 -j DNAT --to-destination ${ZIELIP}:27016
iptables -t nat -A POSTROUTING -p tcp --dport 27016 -j MASQUERADE
# Info
echo -n "Routing zur IP ${ZIELIP} gesetzt"
echo ""

