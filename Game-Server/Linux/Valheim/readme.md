# Start Valheim-Server with Docker:

~~~~~
$ docker run -d --rm --name valheim_server -p 2456-2457:2456-2457 \
    -e Servername="Servername" \
    -e Seed="anyseed" \
    -e Passwort="secret" \
joyki/valheim_server:latest
~~~~~