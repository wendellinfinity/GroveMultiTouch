/*
 GroveMultiTouch.h - Library for the Grove I2C Touch Sensor
 Created by Wendell A. Capili, August 27, 2011.
 
 Code adapted from:
 http://bildr.org/2011/05/mpr121_arduino/ 
 
 Released into the public domain.
 */


#ifndef GroveMultiTouch_h
#define GroveMultiTouch_h

#if defined(ARDUINO) && ARDUINO >= 100
#include "Arduino.h"
#else
#include "WProgram.h"
#endif

#include <Wire.h>

class GroveMultiTouch {
    public:
    //GroveMultiTouch(int irqPin, TwoWire &wire);    
    GroveMultiTouch(int irqPin);
    void initialize();
    void readTouchInputs();
    boolean getTouchState(int pad);
    
    private:
    //TwoWire* _wire;
    int _irqPin;
    boolean _touchStates[12];
    void mpr121_setup();
    boolean checkInterrupt();
    void set_register(int address, unsigned char r, unsigned char v);
};

#endif