/*
 GroveI2CTouchTest.pde - Sample code for the SeeedStudio Grove I2C Touch Sensor
 http://seeedstudio.com/wiki/index.php?title=Twig_-_I2C_Touch_Sensor_v0.93b
 
 Prerequisite:
 A modification of the Grove I2C Touch sensor is needed
 Solder a pin to the INT terminal in the I2C sensor to connect it to one pin in Arduino
 
 Created by Wendell A. Capili, August 27, 2011.
 http://wendellinfinity.wordpress.com
 
 Released into the public domain.

*/

#include <Wire.h> // include I2C library
#include <GroveMultiTouch.h> // include our Grove I2C touch sensor library

// initialize the Grove I2C touch sensor
// IMPORTANT: in this case, INT pin was connected to pin7 of the Arduino 
// (this is the interrupt pin)
GroveMultiTouch feelers(7);
 // keep track of 4 pads' states
boolean padTouched[4];

void setup() {
     Serial.begin(9600); // for debugging
     Wire.begin(); // needed by the GroveMultiTouch lib
     feelers.initialize(); // initialize the feelers
     // initialize the containers
     for(int i=0; i<=3; i++) {
          padTouched[i]=false;
     }
}

void loop() {
     feelers.readTouchInputs(); // test read the touch sensors
     // loop through our touch sensors 1 to 4
     for(int i=0; i<=3; i++) {
          // get the touch state based on pin #
          if(feelers.getTouchState(i)) {
               if(!padTouched[i]) {
                    // print in serial that it was touched
                    Serial.print("Pad ");
                    Serial.print(i);               
                    Serial.println(" was touched");
               }
               // flag the touch sensor state
               padTouched[i]=true;
          } 
          else {
               if(padTouched[i]) {
                    // print in serial that it was released                    
                    Serial.print("Pad ");
                    Serial.print(i);               
                    Serial.println(" was released");
               }
               // reset the touch sensor state               
               padTouched[i]=false;
          }
     }
}


