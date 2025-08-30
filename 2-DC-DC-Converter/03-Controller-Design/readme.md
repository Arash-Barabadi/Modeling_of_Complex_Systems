# Controller Design
# Purpose of defining a voltage controller for a Converter
## A buck converter is a DC-DC converter that steps down a higher DC input voltage to a lower DC output voltage. 
## On its own, the output voltage is determined by the duty cycle (PWM ratio) and the load.
## But in reality:
## 1- The input voltage (UB) can fluctuate (battery discharges, supply varies). 2- The load resistance (R_Last) changes (e.g., when you connect 1 bulb vs. 2 bulbs). 3- The components (inductor, capacitor, MOSFET) are not ideal → voltage drops, switching losses.
## So if you only fix the PWM duty cycle without a controller: the output voltage will not stay constant. It will change with every disturbance.

## The voltage controller’s job is:
## Compare actual output voltage with the desired setpoint (e.g., 5 V) AND Adjust the PWM duty cycle automatically so that the output voltage stays at the setpoint. So it Rejects disturbances from input voltage changes or load variations.
