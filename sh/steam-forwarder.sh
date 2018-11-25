ZIELIP=$( resolveip -s ENTER_URL)
# resolveip is in mysql-server - Package

echo "Forward to ${ZIELIP}"

iptables -t nat -A PREROUTING -p tcp --dport 27015 -j DNAT --to-destination ${ZIELIP}:27015
iptables -t nat -A POSTROUTING -p tcp --dport 27015 -j MASQUERADE
iptables -t nat -A PREROUTING -p udp --dport 27015 -j DNAT --to-destination ${ZIELIP}:27015
iptables -t nat -A POSTROUTING -p udp --dport 27015 -j MASQUERADE

iptables -t nat -A PREROUTING -p tcp --dport 27016 -j DNAT --to-destination ${ZIELIP}:27016
iptables -t nat -A POSTROUTING -p tcp --dport 27016 -j MASQUERADE
iptables -t nat -A PREROUTING -p udp --dport 27016 -j DNAT --to-destination ${ZIELIP}:27016
iptables -t nat -A POSTROUTING -p udp --dport 27016 -j MASQUERADE

iptables -t nat -A PREROUTING -p tcp --dport 27017 -j DNAT --to-destination ${ZIELIP}:27017
iptables -t nat -A POSTROUTING -p tcp --dport 27017 -j MASQUERADE
iptables -t nat -A PREROUTING -p udp --dport 27017 -j DNAT --to-destination ${ZIELIP}:27017
iptables -t nat -A POSTROUTING -p udp --dport 27017 -j MASQUERADE

iptables -t nat -A PREROUTING -p tcp --dport 27018 -j DNAT --to-destination ${ZIELIP}:27018
iptables -t nat -A POSTROUTING -p tcp --dport 27018 -j MASQUERADE
iptables -t nat -A PREROUTING -p udp --dport 27018 -j DNAT --to-destination ${ZIELIP}:27018
iptables -t nat -A POSTROUTING -p udp --dport 27018 -j MASQUERADE

iptables -t nat -A PREROUTING -p tcp --dport 27019 -j DNAT --to-destination ${ZIELIP}:27019
iptables -t nat -A POSTROUTING -p tcp --dport 27019 -j MASQUERADE
iptables -t nat -A PREROUTING -p udp --dport 27019 -j DNAT --to-destination ${ZIELIP}:27019
iptables -t nat -A POSTROUTING -p udp --dport 27019 -j MASQUERADE

iptables -t nat -A PREROUTING -p tcp --dport 27020 -j DNAT --to-destination ${ZIELIP}:27020
iptables -t nat -A POSTROUTING -p tcp --dport 27020 -j MASQUERADE
iptables -t nat -A PREROUTING -p udp --dport 27020 -j DNAT --to-destination ${ZIELIP}:27020
iptables -t nat -A POSTROUTING -p udp --dport 27020 -j MASQUERADE

iptables -t nat -A PREROUTING -p tcp --dport 7777 -j DNAT --to-destination ${ZIELIP}:7777
iptables -t nat -A POSTROUTING -p tcp --dport 7777 -j MASQUERADE
iptables -t nat -A PREROUTING -p udp --dport 7777 -j DNAT --to-destination ${ZIELIP}:7777
iptables -t nat -A POSTROUTING -p udp --dport 7777 -j MASQUERADE

iptables -t nat -A PREROUTING -p tcp --dport 7778 -j DNAT --to-destination ${ZIELIP}:7778
iptables -t nat -A POSTROUTING -p tcp --dport 7778 -j MASQUERADE
iptables -t nat -A PREROUTING -p udp --dport 7778 -j DNAT --to-destination ${ZIELIP}:7778
iptables -t nat -A POSTROUTING -p udp --dport 7778 -j MASQUERADE

iptables -t nat -A PREROUTING -p tcp --dport 7779 -j DNAT --to-destination ${ZIELIP}:7779
iptables -t nat -A POSTROUTING -p tcp --dport 7779 -j MASQUERADE
iptables -t nat -A PREROUTING -p udp --dport 7779 -j DNAT --to-destination ${ZIELIP}:7779
iptables -t nat -A POSTROUTING -p udp --dport 7779 -j MASQUERADE

iptables -t nat -A PREROUTING -p tcp --dport 7780 -j DNAT --to-destination ${ZIELIP}:7780
iptables -t nat -A POSTROUTING -p tcp --dport 7780 -j MASQUERADE
iptables -t nat -A PREROUTING -p udp --dport 7780 -j DNAT --to-destination ${ZIELIP}:7780
iptables -t nat -A POSTROUTING -p udp --dport 7780 -j MASQUERADE

iptables -t nat -A PREROUTING -p tcp --dport 7781 -j DNAT --to-destination ${ZIELIP}:7781
iptables -t nat -A POSTROUTING -p tcp --dport 7781 -j MASQUERADE
iptables -t nat -A PREROUTING -p udp --dport 7781 -j DNAT --to-destination ${ZIELIP}:7781
iptables -t nat -A POSTROUTING -p udp --dport 7781 -j MASQUERADE
