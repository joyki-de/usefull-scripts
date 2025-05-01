import requests
import time
from datetime import datetime
from fritzconnection.lib.fritzstatus import FritzStatus

fs = FritzStatus(address='192.168.178.1')

php_url = 'http://192.168.178.55/post-traffic.php'

def get_traffic():
        sent_start = fs.bytes_sent
        recv_start = fs.bytes_received
        time.sleep(1)
        sent_end = fs.bytes_sent
        recv_end = fs.bytes_received
        delta_sent = sent_end - sent_start
        delta_recv = recv_end - recv_start
        return delta_sent, delta_recv

def send_to_php(timestamp, upload, download):
    data = {
        'timestamp': timestamp,
        'upload': up,
        'download': down
    }
    try:
        response = requests.post(php_url, data=data)
# Debug on/off
#        if response.status_code == 200:
#            print(f"[OK] Gesendet: {timestamp} | Upload: {upload} B | Download: {download} B")
#        else:
#            print(f"[Fehler] PHP gab Code {response.status_code} zurück.")
    except Exception as e:
        print(f"[Error] {e}")

if __name__ == "__main__":
    now = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    up, down = get_traffic()
    send_to_php(now, up, down)
