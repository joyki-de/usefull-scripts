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
cp -a /path/to/tbl/files .
mkdir -pv bin/Debug/${framework_version}/
ln -s ${PWD}/tbl/ ${PWD}/bin/Debug/${framework_version}/
cd ..

export TERM=xterm
cd NexusForever.MapGenerator/
dotnet run /path/to/wildstar_directory/WildStar/Patch/
cp -a output ../NexusForever.WorldServer/map
cd ..

