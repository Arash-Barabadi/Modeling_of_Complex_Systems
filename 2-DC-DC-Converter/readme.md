# PWM resolution input:
### Pulse Width Modulation (PWM) is a technique where a digital signal rapidly switches between ON and OFF, and the ratio of ON-time to the total period (duty cycle) controls the Average OUPUT Voltage or power. In a buck converter, the PWM duty cycle determines how much of the input voltage is passed to the output, thereby setting the output voltage.
### What if it were 11-bit or 13-bit?
###   11-bit (2048 steps): less fine control, ~0.05% resolution per step. That may cause visible “jumps” in output voltage under light loads or precise regulation requirements.
###   13-bit (8192 steps): finer control, ~0.012% per step. But needs faster counters to maintain high PWM frequency, which increases MCU cost/power.

# Load Resistance Model
### It decides what the effective load resistance 𝑅(Last) is, based on the output voltage Ua and whether you connect 1 bulb or 2 bulbs.

<img width="1340" height="519" alt="image" src="https://github.com/user-attachments/assets/423d69dd-0e9e-497f-90a9-9829c7fff793" />


#### In the Switch Block the Threshold is specified as 1.5 instead of 2, why? 

<img width="1244" height="546" alt="image" src="https://github.com/user-attachments/assets/14ff6dc9-7078-48d9-8a39-ac90bf580ad6" />

##### In Simulink, checking exact equality with integers (==2) is numerically risky when signals may not be exactly integers (due to rounding, floating-point representation, or block settings).
##### Example: If B comes from some other calculation and ends up being 1.999999, then ==2 would fail.
##### But with B > 1.5, both 2.0 and 1.999999 would correctly be taken as “2 bulbs”.

#### Why is The R-filter deployed here?

<img width="1213" height="467" alt="image" src="https://github.com/user-attachments/assets/c43b2893-afdb-4bd3-bd1b-843118a67ca3" />

##### The lookup tables give discrete resistance values depending on voltage. Without filtering, these values may jump abruptly → causing simulation instability. The R-Filter smooths those jumps, making R(Last) behave more like a real filament heating up gradually.

# Step size h(T) calculation 
### In a simulation, the computer does not solve differential equations continuously — it approximates them in discrete time steps. The step size h is the length of one time step in seconds.
### 2. Why it matters? 
#### 1- If h is too large → The solver skips over important fast dynamics (like switching ripple). The result can become inaccurate or even unstable. 
#### 2- If h is too small → The simulation is accurate but runs very slowly. 
### So the art is to pick h small enough for accuracy but not unnecessarily small (to save computation time).
### ℎ  must be small enough to capture both the Converter Dynamics and the PWM Switching Events.
<img width="974" height="399" alt="image" src="https://github.com/user-attachments/assets/0dbae32d-f6cc-4107-884d-4ce0b06ff6b1" />

<img width="936" height="427" alt="image" src="https://github.com/user-attachments/assets/00920448-524f-4f3e-83b0-a78ab64c5b0e" />

<img width="928" height="236" alt="image" src="https://github.com/user-attachments/assets/6d0187f6-de06-4685-97b6-895b4574c19f" />

## in simple words:
### 1- Find the fastest natural time constant of the converter (𝑇 krit).
### 2- Divide it by ~20 to get ℎ(𝑇)
### 3- Take the PWM period and divide it by the chosen number of points per cycle (N) to get ℎ(𝐷)
### 4- The smaller of the two is the step size h used in simulation.
