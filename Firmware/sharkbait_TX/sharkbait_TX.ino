/* Shark Bair Firmware TX
 *  Program sends a signal to each of the 4 pumping stations and checks to see if they are running
 *  It will also send a "Flow" value to make sure they are pumping at the correct rate.
 */
#include <SPI.h>
#include <RH_RF95.h>


// for feather m0
#define RFM95_CS 13
#define RFM95_RST 11
#define RFM95_INT 12


// Change to 434.0 or other frequency, must match RX's freq!
#define RF95_FREQ 915.0

// Singleton instance of the radio driver
RH_RF95 rf95(RFM95_CS, RFM95_INT);

void setup()
{
  pinMode(RFM95_RST, OUTPUT);
  digitalWrite(RFM95_RST, HIGH);

  Serial.begin(115200);
  //while (!Serial) {
  //  delay(1);
  //}

  delay(100);

  Serial.println("Feather LoRa TX Test!");

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
  Serial.print("Set Freq to: "); Serial.println(RF95_FREQ);

  // Defaults after init are 434.0MHz, 13dBm, Bw = 125 kHz, Cr = 4/5, Sf = 128chips/symbol, CRC on

  // The default transmitter power is 13dBm, using PA_BOOST.
  // If you are using RFM95/96/97/98 modules which uses the PA_BOOST transmitter pin, then
  // you can set transmitter powers from 5 to 23 dBm:
  rf95.setTxPower(23, false);
}

int16_t packetnum = 0;  // packet counter, we increment per xmission

void loop()
{
  int x = 0;
  while(x < 4){ 
  transmitBait(x,0,9);
  delay(1000); // Wait 1 second between transmits, could also 'sleep' here!
  x++;
  }

}


//Sends to the bait number (1-4), selects the state (0/off 1/on), selects flow setting (0-9)

void transmitBait(int baitnum, int state, int flow) {
  digitalWrite(13, HIGH);
  Serial.println("Transmitting..."); // Send a message to rf95_server
  String sendStr = String(baitnum);
  sendStr += ",";
  sendStr += String(state);
  sendStr += ",";
  sendStr += String(flow);
  Serial.print("Sending "); Serial.println(sendStr);
  char sendBuf[6];
  sendStr.toCharArray(sendBuf, 6);
  Serial.println("Sending...");
  delay(10);
  
  rf95.send((uint8_t *)sendBuf, sizeof(sendBuf));

  Serial.println("Waiting for packet to complete...");
  delay(10);
  rf95.waitPacketSent();
  // Now wait for a reply
  uint8_t buf[RH_RF95_MAX_MESSAGE_LEN];
  uint8_t len = sizeof(buf);

  Serial.println("Waiting for reply...");
  if (rf95.waitAvailableTimeout(700))
  {
    // Should be a reply message for us now
    if (rf95.recv(buf, &len))
    {
      Serial.print("Got reply: ");
      Serial.println((char*)buf);
      Serial.print("RSSI: ");
      Serial.println(rf95.lastRssi(), DEC);
    }
    else
    {
      Serial.println("Receive failed");
    }
  }
  else
  {
    Serial.println("No reply, is there a listener around?");
  }
  digitalWrite(13, LOW);
}
