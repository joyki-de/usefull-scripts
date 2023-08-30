// lese aus Website
#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <ESP8266WiFi.h>

const char* ssid     = "WLANSSID";
const char* password = "xxx";
const char* host = "10.0.0.1";

#define SCREEN_WIDTH 128
#define SCREEN_HEIGH 64
#define OLED_RESET -1
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGH, &Wire, OLED_RESET);

int cw = SSD1306_WHITE;
int cb = SSD1306_BLACK;

WiFiClient client;

void setup() {
  Serial.begin(9600);
  delay(100);
  if (!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) {
    Serial.println("Display error");
  }
  display.clearDisplay();
  display.setTextSize(1);
  display.setTextColor(cw);
  display.println("-= Initial Monitor =-");
  display.println();
  display.display(); delay(1000);
  display.println("Connect to WLAN...");
  display.display(); delay(2000);
  Serial.println();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(100);
    Serial.print(".");
  };
  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
  //display.fillScreen(cb);
  display.print("IP:");
  display.print(WiFi.localIP());
  display.display(); delay(2000);
  display.println();
  display.println();
  display.println("Load Data..."); display.display(); delay(500);
  delay(100);
  display.clearDisplay();
  Serial.println("Connect to Server");
}

void loop() {

  display.clearDisplay();
  display.setTextSize(1);
  // display.setCursor(1, 1);
  display.display();

  const int httpPort = 80;
  if ( !client.connect(host, httpPort)) {
    Serial.println("Server connection failed");
    return;
  }

  // Load Data
  String url_pv = "/OLED_PV.php";
  String PVOUT;
  Serial.println("Request URL PV");
  client.print(String("GET ") + url_pv + " HTTP/1.1\r\n" + "Host: " + host + "\r\n" + "Connection: close\r\n\r\n");
  unsigned long lasttime_pv = millis();
  while (!client.available() && millis() - lasttime_pv < 10000) {
    delay(1);
  }
  while (client.available()) {
    String line_pv = client.readStringUntil('\n');
    if (line_pv.indexOf("Power: ") >= 0 ) {
      PVOUT = (line_pv.substring(6, 10));

      Serial.println(PVOUT);
      display.setTextSize(2);
      display.clearDisplay();
      display.setCursor(0, 0);

      display.println("PV-Anlage");
      display.println("Power: ");
      //   display.println();
      display.setTextSize(3);
      display.println(PVOUT);
      display.println();
      display.display();
    }
  }
  
  delay(60000);
  Serial.println();
    display.clearDisplay();
  display.setTextSize(3);
  display.setCursor(0, 0);
  display.println("RELOAD");
  Serial.println("reload");
  display.display(); delay(100);

};
