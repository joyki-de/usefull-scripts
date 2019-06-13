function _run {
    cd ~/git/NexusForever/Source
    export TERM=vt100
    for server in StsServer AuthServer; do
            if [ $(ps aux | grep NexusForever.${server} | wc -l) -eq 1 ]; then
                    cd NexusForever.${server}
                    dotnet run&
                    cd ..
            else
                    echo "${server} already running!"
            fi;
    done
    if [ $(ps aux | grep NexusForever.WorldServer | wc -l) -eq 1 ]; then
            cd NexusForever.WorldServer
            dotnet run
    else
            echo "WorldServer already running!"
    fi;
}

function _kill {
    echo "Killing NexusForever.StsServer"
    pkill -f NexusForever.StsServer
    echo "Killing NexusForever.AuthServer"
    pkill -f NexusForever.AuthServer
    echo "Killing NexusForever.WorldServer"
    pkill -f NexusForever.WorldServer
}
usage="$(basename "${0}") [-r|k|s|h]
where:
   -r run
   -k kill
   -h show this help message"
while getopts 'hrks' option; do
    case "${option}" in
        h)  echo "${usage}"
            exit
        ;;
        r)  _run
            exit
        ;;
        k)  _kill
            exit
        ;;
        \?) printf "illegal option: -%s\n" "${OPTARG}" >&2
            echo "${usage}" >&2
            exit
        ;;
    esac
done
echo "${usage}"

