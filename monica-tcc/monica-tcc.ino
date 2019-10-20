#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>
#include "max6675.h"

#define FIREBASE_HOST "monica-tcc.firebaseio.com"
#define FIREBASE_AUTH "Vl9gbKjTCH0QQ9b5hkmrmwYH65NoqepMHaK8VEVM"
#define WIFI_SSID "LAR"
#define WIFI_PASSWORD "LAR@1480"

int ktcSO = 4;
int ktcCS = 0;
int ktcCLK = 2;

MAX6675 ktc(ktcCLK, ktcCS, ktcSO); 

int registro;
String nome;
void setup() {
  //Define GPIO2 como saída
  pinMode (5, OUTPUT);
  //Inicia o monitor serial
  Serial.begin(9600);
 
  //Rotina pra conectar ao wifi.
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("conectando");
  while (WiFi.status() != WL_CONNECTED) {
 Serial.print(".");
 delay(1000);
  }
  Serial.println();
  Serial.print("conectado: ");
  Serial.println(WiFi.localIP());
 
  //Iniciar Firebase
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
}
 
void loop() {
  lerSensoresNivel();
  setarEstadoRegistro();
  
  float temperatura = ktc.readCelsius();
  Firebase.setFloat("empresa1/caixa1/temperatura", temperatura);
  
  delay(300);
} 

void lerSensoresNivel() {
  float sensorBaixo = digitalRead(15);
  float sensorMedio = digitalRead(13);
  float sensorAlto = digitalRead(12);
  float sensorExtravasor = digitalRead(14);
  Serial.println("Sensor: ");
  Serial.println(sensorExtravasor);
  if(sensorBaixo == 1) { 
    Firebase.setBool("empresa1/caixa1/sensor-baixo", true); 
  } else { 
    Firebase.setBool("empresa1/caixa1/sensor-baixo", false); 
  }
  
  if(sensorMedio == 1) { 
    Firebase.setBool("empresa1/caixa1/sensor-medio", true); 
  } else { 
    Firebase.setBool("empresa1/caixa1/sensor-medio", false); 
  }
  
  if(sensorAlto == 1) { 
    Firebase.setBool("empresa1/caixa1/sensor-alto", true); 
  } else { 
    Firebase.setBool("empresa1/caixa1/sensor-alto", false); 
  }
  
  if(sensorExtravasor == 1) { 
    Firebase.setBool("empresa1/caixa1/sensor-extravasor", true); 
    Firebase.setBool("empresa1/caixa1/registro", false);
  } else { 
    Firebase.setBool("empresa1/caixa1/sensor-extravasor", false); 
  }
}

void setarEstadoRegistro() {
  registro = Firebase.getBool("empresa1/caixa1/registro");
  
  if(registro == 1){
    digitalWrite(5 ,HIGH);
  } else {
    digitalWrite(5,LOW);
  }
}

 

  
