#include <SPI.h>
#include <Wire.h>
#include "DHT.h"
#include <Bridge.h>
#include <HttpClient.h>
#include "pitches.h"
 
#define DHTTYPE DHT11
#define DHTPIN 7

DHT dht(DHTPIN, DHTTYPE);
// Variables

unsigned long time;

// Initialize the client library
HttpClient client;

//set website url
String url = "http://104.236.20.82:80/api/v1/plants_datas/";

//Init leds
int redPin = 11;
int bluePin = 10;
int greenPin = 9;

int maxLight = 1050;
int minLight = 550;
int maxWater = 650;
int minWater = 150;
int maxTemp = 40;
int minTemp = 10;

//set statut
int statut;

//set Lastvalues
int lastStatut = 0;
int lastDong = 0;

int nbNote;
bool dongStatut = false;

int melody1[] = {
  NOTE_D4,NOTE_F4,NOTE_D5,
  NOTE_D4,NOTE_F4,NOTE_D5,
  NOTE_E5,NOTE_F5,NOTE_E5,NOTE_F5,
  NOTE_E5,NOTE_C5,NOTE_A4,
  NOTE_A4,NOTE_D4,NOTE_F4,NOTE_G4,
  NOTE_A4,
  NOTE_A4,NOTE_D4,NOTE_F4,NOTE_G4,
  NOTE_E4
};

int noteDurations1[] = {
  8,8,2,
  8,8,2,
  3,8,8,8,
  8,8,2,
  4,4,8,8,
  2,
  4,4,8,8,
  2
};

int melody2[] = {
  NOTE_E7, NOTE_E7, 0, NOTE_E7,
  0, NOTE_C7, NOTE_E7, 0,
  NOTE_G7, 0, 0,  0,
  NOTE_G6, 0, 0, 0,
 
  NOTE_C7, 0, 0, NOTE_G6,
  0, 0, NOTE_E6, 0,
  0, NOTE_A6, 0, NOTE_B6,
  0, NOTE_AS6, NOTE_A6, 0,
 
  NOTE_G6, NOTE_E7, NOTE_G7,
  NOTE_A7, 0, NOTE_F7, NOTE_G7,
  0, NOTE_E7, 0, NOTE_C7,
  NOTE_D7, NOTE_B6, 0, 0,
 
  NOTE_C7, 0, 0, NOTE_G6,
  0, 0, NOTE_E6, 0,
  0, NOTE_A6, 0, NOTE_B6,
  0, NOTE_AS6, NOTE_A6, 0,
 
  NOTE_G6, NOTE_E7, NOTE_G7,
  NOTE_A7, 0, NOTE_F7, NOTE_G7,
  0, NOTE_E7, 0, NOTE_C7,
  NOTE_D7, NOTE_B6, 0, 0
};

int noteDurations2[] = {
  12, 12, 12, 12,
  12, 12, 12, 12,
  12, 12, 12, 12,
  12, 12, 12, 12,
 
  12, 12, 12, 12,
  12, 12, 12, 12,
  12, 12, 12, 12,
  12, 12, 12, 12,
 
  9, 9, 9,
  12, 12, 12, 12,
  12, 12, 12, 12,
  12, 12, 12, 12,
 
  12, 12, 12, 12,
  12, 12, 12, 12,
  12, 12, 12, 12,
  12, 12, 12, 12,
 
  9, 9, 9,
  12, 12, 12, 12,
  12, 12, 12, 12,
  12, 12, 12, 12,
};

int melody3[] = {
  NOTE_C4, NOTE_C5, NOTE_A3, NOTE_A4,
  NOTE_AS3, NOTE_AS4, 0,
  0,
  NOTE_C4, NOTE_C5, NOTE_A3, NOTE_A4,
  NOTE_AS3, NOTE_AS4, 0,
  0,
  NOTE_F3, NOTE_F4, NOTE_D3, NOTE_D4,
  NOTE_DS3, NOTE_DS4, 0,
  0,
  NOTE_F3, NOTE_F4, NOTE_D3, NOTE_D4,
  NOTE_DS3, NOTE_DS4, 0,
  0, NOTE_DS4, NOTE_CS4, NOTE_D4,
  NOTE_CS4, NOTE_DS4,
  NOTE_DS4, NOTE_GS3,
  NOTE_G3, NOTE_CS4,
  NOTE_C4, NOTE_FS4, NOTE_F4, NOTE_E3, NOTE_AS4, NOTE_A4,
  NOTE_GS4, NOTE_DS4, NOTE_B3,
  NOTE_AS3, NOTE_A3, NOTE_GS3,
  0, 0, 0
};

int noteDurations3[] = {
  12, 12, 12, 12,
  12, 12, 6,
  3,
  12, 12, 12, 12,
  12, 12, 6,
  3,
  12, 12, 12, 12,
  12, 12, 6,
  3,
  12, 12, 12, 12,
  12, 12, 6,
  6, 18, 18, 18,
  6, 6,
  6, 6,
  6, 6,
  18, 18, 18, 18, 18, 18,
  10, 10, 10,
  10, 10, 10,
  3, 3, 3
};
               
void setup(void)
{
  pinMode(13, OUTPUT);
  digitalWrite(13, LOW);
  Bridge.begin();
  digitalWrite(13, HIGH);
  
  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);
  Serial.begin(9600);
  dht.begin();
}
  
void loop(void)
{
    // Measure light level
    int lightLevel = analogRead(A0);
    
    // Measure Temperature level
    int tempLevel = dht.readTemperature();
    while(isnan(tempLevel) || tempLevel == 0){
      delay(10000);
      tempLevel = dht.readTemperature();
    }
    
    //Measure humidity level
    int waterLevel = analogRead(A1);
    
    if(tempLevel <= maxTemp && tempLevel >= minTemp && lightLevel <= maxLight && lightLevel >= minLight && waterLevel <= maxWater && waterLevel >= minWater){
      RGB(0, 150, 0); // this calls the RGB function
      statut = 1;
      dongStatut = false;
      statutTreatement();
    }
    else{
      if(tempLevel > maxTemp || lightLevel > maxLight || waterLevel < minWater){
        RGB(150,0,0);
        statut = 2;
        statutTreatement();
      }
      else{
        RGB(0,0,150);
        statut = 3;
        statutTreatement();
      }
    }
    
    // Print measurements
    Serial.print("Light level: ");
    Serial.println(lightLevel);
    Serial.print("Temperature: ");
    Serial.println(tempLevel);
    Serial.print("Humidite: ");
    Serial.println(waterLevel);
    Serial.println("");

    createNymphiData(waterLevel, lightLevel, tempLevel);
    // Repeat 50 ms
    delay(5000);
  
}

//ledRGB function
void RGB(int red, int green, int blue)
{
  analogWrite(redPin, red);
  analogWrite(greenPin, green);
  analogWrite(bluePin, blue);  
}

// sendData of plant
void createNymphiData(int waterLevel, int lightLevel, int tempLevel)
{
  String urlForSend = url + String(waterLevel) + "/" + String(lightLevel) + "/" + String(tempLevel);

  // Make a HTTP request:
  client.get(urlForSend);

  // if there are incoming bytes available
  // from the server, read them and print them:
  while (client.available()) {
    char c = client.read();
    Serial.print(c);
  }
  Serial.flush();

  delay(5000);
}

//doing treatement depend of old status and old date
void statutTreatement(){
  if((lastStatut != 0 && statut != lastStatut)|| dongStatut==true){
    dongStatut = true;
    if(lastStatut != statut){
      lastDong = 0;
    }
  
    switch(statut){
      case 1 : 
        dongStatut = false;
        nbNote = 15;
        song(melody1, noteDurations1);
        break;
      case 2 :
        nbNote = 15;
        lastDong = lastDong+1;
        song(melody2, noteDurations2);
        break;
      case 3 :  
        
        nbNote = 15;
        lastDong = lastDong+1;
        song(melody3, noteDurations3);
        break;
    }
    if(lastDong == 5){
     lastDong = 0; 
    }
  }
  lastStatut = statut;
}

//treatement of song
void song(int melody[], int noteDurations[])
{
  
  if(lastStatut != statut || lastDong == 5){
    // iterate over the notes of the melody:
    for (int thisNote = 0; thisNote < nbNote; thisNote++) {
      
      // to calculate the note duration, take one second
      // divided by the note type.
      //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.
      int noteDuration = 1000/noteDurations[thisNote];
      tone(8, melody[thisNote],noteDuration);
      
      // to distinguish the notes, set a minimum time between them.
      // the note's duration + 30% seems to work well:
      int pauseBetweenNotes = noteDuration * 1.30;
      delay(pauseBetweenNotes);
      // stop the tone playing:
      noTone(8);
    }
  }
  if(lastDong == 5){
   lastDong = 0; 
  }
}
