
## Load Resistance Model
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

## Stepsize h(T) calculation 
### In a simulation, the computer does not solve differential equations continuously — it approximates them in discrete time steps. The step size h is the length of one time step in seconds.
### 2. Why it matters If h is too large → The solver skips over important fast dynamics (like switching ripple). The result can become inaccurate or even unstable. If h is too small → The simulation is accurate but runs very slowly. So the art is to pick h small enough for accuracy but not unnecessarily small (to save computation time).
