
### Load Resistance Model
#### It decides what the effective load resistance 𝑅(Last) is, based on the output voltage Ua and whether you connect 1 bulb or 2 bulbs.

<img width="1340" height="519" alt="image" src="https://github.com/user-attachments/assets/423d69dd-0e9e-497f-90a9-9829c7fff793" />


#### In the Switch Block the Threshold is specified as 1.5 instead of 2, why? In Simulink, checking exact equality with integers (==2) is numerically risky when signals may not be exactly integers (due to rounding, floating-point representation, or block settings).
##### Example: If B comes from some other calculation and ends up being 1.999999, then ==2 would fail.
##### But with B > 1.5, both 2.0 and 1.999999 would correctly be taken as “2 bulbs”.
