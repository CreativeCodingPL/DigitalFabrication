#include <AccelStepper.h>

//motor a
#define in1a 11
#define in2a 10
#define in3a 9
#define in4a 8

//motor b
#define in1b 5
#define in2b 4
#define in3b 3
#define in4b 2

//zmieniłem kolejność z 1,3,2,4 na 4,2,3,1 żeby dodatnie kroki
//poruszały zgodnie z ruchem wskazówek zegara
AccelStepper stepperA(AccelStepper::HALF4WIRE, in4a, in2a, in3a, in1a);
AccelStepper stepperB(AccelStepper::HALF4WIRE, in4b, in2b, in3b, in1b);

void setup() {
  stepperA.setMaxSpeed(1200);
  stepperA.setSpeed(50);
  stepperB.setMaxSpeed(1200);
  stepperB.setSpeed(60);
}
 

void loop()
{  
   stepperA.runSpeed();
   stepperB.runSpeed();
}
