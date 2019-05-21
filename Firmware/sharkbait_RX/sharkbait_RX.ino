/*Shark Bait Firmware RX
   Program recieves a signal from the remote to start or stop the shark bait
   It recieves a value asking if that is the currect receiver, and also a "Flow" value selected by the user.
*/


#include <SPI.h>
#include <RH_RF95.h>
#include <Servo.h>

Servo myservo;

#define RFM95_CS 13
#define RFM95_RST 11
#define RFM95_INT 12

// Change to 434.0 or other frequency, must match RX's freq!
#define RF95_FREQ 915.0

// Singleton instance of the radio driver
RH_RF95 rf95(RFM95_CS, RFM95_INT);

// Blinky on receipt
#define LED 13

int RecNum = 0;
int state = 0; // 0 = off, 1 = pumping
int flow = 0;  // Flow Settings(0-9)

#define PRIME A1
#define ARM A0
#define ARMLED 9
#define SERVO 5
#define LIMIT 5

int s[4] = {A3, A2, A5, A4};
int com = 6;

void setup()
{
  pinMode(LED, OUTPUT);
  pinMode(RFM95_RST, OUTPUT);
  digitalWrite(RFM95_RST, HIGH);
  pinMode(com, INPUT);
  for (int x = 0; x < 4; x++) {
    pinMode(s[x], OUTPUT);
    digitalWrite(s[x], LOW);
  }


  //Serial.begin(115200);
  //while (!Serial) {
  //  delay(1);
  //}
  delay(100);
  // Check what number the sensor is set to (with the Rotary DIP);
  RecNum = checkRec();
  myservo.attach(SERVO);
  myservo.write(90);
  delay(500);
  myservo.detach();

  Serial.println("Feather LoRa RX Test!");

  // manual reset
  digitalWrite(RFM95_RST, LOW);
  delay(10);
  digitalWrite(RFM95_RST, HIGH);
  delay(10);

  while (!rf95.init()) {
    Serial.println("LoRa radio init failed");
    while (1);
  }
  Serial.println("LoRa radio init OK!");

  // Defaults after init are 434.0MHz, modulation GFSK_Rb250Fd250, +13dbM
  if (!rf95.setFrequency(RF95_FREQ)) {
    Serial.println("setFrequency failed");
    while (1);
  }
  //Serial.print("Set Freq to: "); Serial.println(RF95_FREQ);

  // Defaults after init are 434.0MHz, 13dBm, Bw = 125 kHz, Cr = 4/5, Sf = 128chips/symbol, CRC on

  // The default transmitter power is 13dBm, using PA_BOOST.
  // If you are using RFM95/96/97/98 modules which uses the PA_BOOST transmitter pin, then
  // you can set transmitter powers from 5 to 23 dBm:
  rf95.setTxPower(23, false);
}

void loop()
{
  if (rf95.available())
  {
    // Should be a message for us now
    uint8_t buf[RH_RF95_MAX_MESSAGE_LEN];
    uint8_t len = sizeof(buf);

    if (rf95.recv(buf, &len))
    {
      digitalWrite(LED, HIGH);
      //RH_RF95::printBuffer("Received: ", buf, len);
      Serial.print("Got: ");
      Serial.println((char*)buf);
      Serial.print("RSSI: ");
      Serial.println(rf95.lastRssi(), DEC);

      // Message for this number.
      if (char(buf[0]) == RecNum + 48) {
        myservo.attach(SERVO);
        myservo.write(0);
        delay(500);
        myservo.detach();
        state = buf[2] - 48;
        flow = buf[4] - 48;
        String sendStr = String(RecNum);
        sendStr += ",";
        sendStr += String(state);
        sendStr += ",";
        sendStr += String(flow);
        char sendBuf[6];
        sendStr.toCharArray(sendBuf, 6);
        rf95.send((uint8_t *)sendBuf, sizeof(sendBuf));
        rf95.waitPacketSent();
        Serial.println("Taking Commands:");
        Serial.print("State: ");
        Serial.println(state);
        Serial.print("Flow Setting: ");
        Serial.println(flow);
        Serial.println("Sent a reply");
      }
      else {
        Serial.println("Message for someone else...");
      }
      digitalWrite(LED, LOW);
    }
    else
    {
      Serial.println("Receive failed");
    }
  }
}



byte checkMuxPin(int pin) {
  for (int i = 0; i < 4; i++) {
    byte state = bitRead(pin, i);
    digitalWrite(s[i], state);
    Serial.print(state);
  }
  Serial.print(",");
  Serial.println(pin);
  byte check = digitalRead(com);
  return check;
}

int checkRec() {
  int Rec = 0;
  for (int i = 11; i < 15; i++) {
    byte val = checkMuxPin(i);
    if (val == 0) {
      Rec = i - 11;
    }
  }
  Serial.print("Receiver Number: ");
  Serial.println(Rec);
  return Rec;
}

byte checkDir() {
  byte dir = checkMuxPin(10);
  return dir;
}
