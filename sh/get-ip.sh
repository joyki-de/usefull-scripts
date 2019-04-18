#!/bin/bash
#
VERSION="1.0"
echo -n "URL: "
read -e URL
echo -n "IP:  "
nslookup ${URL} | tail -2 | head -1 | awk '{print $2}'

