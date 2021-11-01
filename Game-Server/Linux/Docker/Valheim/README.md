# Valheim-Server
** Docker-Image for Valheim

! TESTING !

When running the image, mount the volume /home/user/Steam

mkdir -p gamedir
docker run -di -p 2456-2457:2456-2457/udp --restart unless-stopped -v $PWD/gamedir:/home/user/Steam joyki/valheim_server
