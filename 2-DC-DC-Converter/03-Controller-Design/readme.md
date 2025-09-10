# Voltage Controller Design
## Purpose of defining a voltage controller for a Converter ...
### A buck converter is a DC-DC converter that steps down a higher DC input voltage to a lower DC output voltage. 
### On its own, the output voltage is determined by the duty cycle (PWM ratio) and the load.
### But in reality:
### 1- The input voltage (UB) can fluctuate (battery discharges, supply varies). 2- The load resistance (R_Last) changes (e.g., when you connect 1 bulb vs. 2 bulbs). 3- The components (inductor, capacitor, MOSFET) are not ideal → voltage drops, switching losses.
### So if you only fix the PWM duty cycle without a controller: the output voltage will not stay constant. It will change with every disturbance.

### The voltage controller’s job is:
### Compare actual output voltage with the desired setpoint (e.g., 5 V) AND Adjust the PWM duty cycle automatically so that the output voltage stays at the setpoint. So it Rejects disturbances from input voltage changes or load variations.
### Now Lets get back to our problem: ...

## Assumptions
## There are some terms to know:
<img width="800" height="185" alt="image" src="https://github.com/user-attachments/assets/0a6f80b7-4243-4553-8ea5-a66fd5715db8" />

### - Target output is Ua = 5V, 
### - Plant operated with 2 small bulbs as the load.
## Hints

## The model in the loop simulation block digram is as follows:

<img width="1469" height="258" alt="image" src="https://github.com/user-attachments/assets/cdd8810d-7a21-4fe4-ad36-272a465aceac" />

### - Input voltage seen by the DC-DC-Wanlder block comes from PWM:

<img width="180" height="95" alt="image" src="https://github.com/user-attachments/assets/47640f5c-9588-4c0d-b4bb-2d50fe6ffe84" />

### - Output voltage from the DC-DC-Wandler block:
<img width="176" height="64" alt="image" src="https://github.com/user-attachments/assets/5514872d-c67f-4e46-98b6-9f5f4ca1282e" />

### - Efficient gain as seen by the Controler (Regler):
<img width="303" height="487" alt="image" src="https://github.com/user-attachments/assets/e0f94a3d-5f6f-471d-bc2c-ebcddebf64f8" />

### - and then convert it to minivolt:
<img width="396" height="83" alt="image" src="https://github.com/user-attachments/assets/744a4b1e-c119-4ace-afa1-a91f73ee6c2d" />

### the description:
<img width="983" height="364" alt="image" src="https://github.com/user-attachments/assets/4e379980-40bd-454f-b0cd-fa3b1662ef5d" />

### in the Step block I've inputed two values but you can only input a constant value to it:
### - The Step block is a test-signal generator.
<img width="503" height="481" alt="image" src="https://github.com/user-attachments/assets/8477ce42-11b2-4c60-b884-1ce93c4a7255" />

### - It lets you change the Sollwert (reference) during simulation to test if your controller follows different demands.
## That's why we see:
### - Initial value = the reference before the step time
### - Final value = the new reference after the step time, as follows 
<img width="565" height="420" alt="image" src="https://github.com/user-attachments/assets/650a0528-96a3-4471-bbb9-1a05f1aff5bb" />

### So one can simulate a “setpoint change” — which is one of the most important tests in control engineering.
### But in reality…
### In real operation of your Buck converter, you usually have only one Sollwert (e.g., 5 V output). In hardware you’d give this setpoint via a fixed value, a knob, or from software. In simulation, you use the Step block to make it time-varying, so you can see how well the controller reacts to changes.
