# Start Valheim-Server with Docker:

~~~~~
docker run -d --name valheim-server -p 2456-2457:2456-2457 -e SERVER="Servername" -e SEED="anyseed" -e PASSWORD="secret" joyki/valheim-server:latest
~~~~~