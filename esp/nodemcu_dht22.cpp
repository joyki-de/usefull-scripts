#include <DHT.h>
#include <ESP8266WiFi.h>

WiFiClient client;

#define DHTPIN 5 // SENSOR PIN
#define DHTTYPE DHT22
DHT dht(DHTPIN, DHTTYPE);

const char *ssid = "WLAN-Name";
const char *password = "WLAN-PW";
const char server[] = "MySQL/MariaDB-IP-Adress";
const char *area = "Name of Area, like Test-Station";

void setup()
{

    Serial.begin(9600);
    delay(100);
    Serial.println();
    Serial.println();
    Serial.print("Connecting to ");
    Serial.println(ssid);

    WiFi.begin(ssid, password);

    while (WiFi.status() != WL_CONNECTED)
    {
        delay(100);
        Serial.print(".");
    };

    Serial.println("");
    Serial.println("WiFi connected");
    Serial.println("IP address: ");
    Serial.println(WiFi.localIP());
}

void loop()
{

    dht.begin();
    Serial.println("sensor inizialized");
    delay(100); // Wait for DHT

    int sensorTemp = dht.readTemperature();
    int sensorHum = dht.readHumidity();

    Serial.print("Temp: ");
    Serial.print(sensorTemp);
    Serial.println("");
    Serial.print("Humi: ");
    Serial.print(sensorHum);
    Serial.println("\n Starting connection to server...");

    if (client.connect(server, 80))
    {
        Serial.println("connected!");
        WiFi.printDiag(Serial);

        String data = "/post-data.php?";
        data += "areaplace=";
        data += (String)area;
        data += "&temp=";
        data += (String)sensorTemp;
        data += "&humi=";
        data += (String)sensorHum;

        Serial.println(data);

        client.print(String("GET ") + data + " HTTP/1.1\r\n" +
                     "Host: " + server + "\r\n" +
                     "Connection: close\r\n\r\n");
        delay(1000);
        client.stop();
        Serial.println("\nConnection close");
        Serial.println("\nSleep then Restart..."); // Bridge on DEV-Board from PIN RST to D0

        ESP.deepSleep(3600e6); // 300e6 -> 5 minutes -> 3600e6 -> 1 hour
    }
};
