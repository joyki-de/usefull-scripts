echo ""
echo "Enter IP: "
read -e IPADRESS
for i in 1470 1480 1490 1500 1600
do ping -c 3 -s $i -i 3 $IPADRESS
echo "***************************************************************"
done

