langfristig alle Docker-Operationen (nicht nur Builds) auf eine extrene Platte auslagern

1. Docker stoppen
    sudo systemctl stop docker

2. Altes Verzeichnis sichern & kopieren:
    sudo rsync -aqxP /var/lib/docker/ /media/ssd/docker/ # neuer Pfad

3. Altes Verzeichnis umbenennen (zur Sicherheit): 
    sudo mv /var/lib/docker /var/lib/docker.bak

4. Erstelle /etc/docker/daemon.json:

{
  "data-root": "/media/ssd/docker"
}

5. Docker neu starten: 

    sudo ln -s /media/ssd/docker /var/lib/docker