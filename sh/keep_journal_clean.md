1:
- sudo nano /etc/systemd/journald.conf
2:
> [Journal]
> SystemMaxUse=500M      # Max. 500 MB Gesamtgröße
> SystemKeepFree=1G      # Mindestens 1 GB freier Speicherplatz
> MaxRetentionSec=1month # Logs älter als 1 Monat löschen
3:
- sudo systemctl restart systemd-journald