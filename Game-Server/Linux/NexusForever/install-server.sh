while true
do
echo ""
echo -n "Enter Path to tbl Files (e.g. /home/files/) "
read -e TBFPATH
echo ""
echo -n "Enter Path to Wildstar-Client (e.g. /home/files/WildstarClient/) :" 
read -e WILDSTAR
echo ""
echo -n "tbl-Files on ${TBFPATH} and Wildstar-Client on ${WILDSTAR} correct?"
echo -n "Don't forget the / on the End of the Patch !"
               case $CONFIRM in
                        y|Y|YES|yes|Yes|j|J)
                                break ;;
                        *) echo "Please enter Path again"
                esac
done
mkdir ${HOME}/git
cd ${HOME}/git
git clone https://github.com/NexusForever/NexusForever.git
cd NexusForever/Source
git checkout develop
framework_version=$(sed -n 's/.*>\(.*[0-9].[0-9]\).*/\1/p' NexusForever.Shared/NexusForever.Shared.csproj)
for server in WorldServer StsServer AuthServer; do 
        cd NexusForever.${server}
        cat ${server}.example.json > ${server}.json
        mkdir -pv bin/Debug/${framework_version}/
        ln -s ${PWD}/${server}.json ${PWD}/bin/Debug/${framework_version}/${server}.json
        cd ..
done

cd NexusForever.WorldServer/
sed -i -e "s|\(.*MapPath\": \"\)\(.*\)|\1$PWD/\2|" WorldServer.json
cp -a ${TBFPATH} .
mkdir -pv bin/Debug/${framework_version}/
ln -s ${PWD}/tbl/ ${PWD}/bin/Debug/${framework_version}/
cd ..

export TERM=xterm
cd NexusForever.MapGenerator/
dotnet run ${WILDSTAR}Patch/
cp -a output ../NexusForever.WorldServer/map
cd ..

