# Start Valheim-Server with Docker:

~~~~~
$ docker run -d --name valheim_server -p 2456-2457:2456-2457 \
    -e SERVER_NAME="Servername" \
    -e WORLD_NAME="anyseed" \
    -e SERVER_PASS="secret" \
joyki/valheim_server:latest
~~~~~