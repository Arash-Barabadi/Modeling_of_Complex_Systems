# Why averaged model? 


## Two poles explained

<img width="953" height="318" alt="image" src="https://github.com/user-attachments/assets/4ce4163b-c271-47f0-808e-36b3223632cb" />

## Why is this a problem in HiL?
<img width="699" height="124" alt="image" src="https://github.com/user-attachments/assets/61567eae-846c-4a1e-8466-dfdb01460558" />

# So ...
### Most voltage controllers care about the slow, average settling of  Ua not the microsecond-scale ripple. The average model captures what the controller needs while being light enough to run on the ESP32 in HiL.
# There are two variants to creat this average model:
### Variant 1 (analytical average model): Based on physics equations (resistances, gain K). Very light to compute → good for HiL. But maybe less accurate.
### Variant 2 (lookup-table average model): Based on measured steady-state data (PWM, frequency → output voltage). Also light to compute → good for HiL. Usually more accurate in the measured range.
# Variant 1:
## What does the averaged model do with these poles?
### It removes the fast pole (high-frequency switching LC dynamics).
### It often even ignores the second pole and just keeps the static gain (P-element).
### This makes the model much simpler: instead of oscillations, you just get the average DC voltage response.
## What is the deduction process of math of the P-gain element?
### Transfer function from input voltage 𝑈 to output voltage Ua
<img width="945" height="80" alt="image" src="https://github.com/user-attachments/assets/f117a417-2ccb-4651-8dc3-cfa899c0c48a" />

### Normalize denominator → standard second-order form...

### Compare with standard PT-2 form:
<img width="646" height="274" alt="image" src="https://github.com/user-attachments/assets/54e1d07a-9173-4578-8091-49b60cbdb63a" />

<img width="655" height="485" alt="image" src="https://github.com/user-attachments/assets/237a3821-a5b0-4324-a988-865ec0564c6f" />

## Therefore:
### We keep only the static gain
<img width="896" height="137" alt="image" src="https://github.com/user-attachments/assets/d96d897e-27c7-4545-88c3-455d976b477d" />

### We know that: 
<img width="417" height="70" alt="image" src="https://github.com/user-attachments/assets/997824be-d70c-4312-9ae8-8028965783eb" />

<img width="712" height="260" alt="image" src="https://github.com/user-attachments/assets/02a82d9b-1efa-4b55-8320-769cb39b7704" />

### If we write PWM in %:
<img width="281" height="108" alt="image" src="https://github.com/user-attachments/assets/92458f03-d35a-4249-a5ff-733147c3cf55" />

### and then ...
<img width="586" height="143" alt="image" src="https://github.com/user-attachments/assets/5d2574b1-fc3a-445b-8266-414cdba2eb08" />

### The following block digram is the HiL (Variant-1) plant built in Simulink. It implements the simple formula:
<img width="474" height="105" alt="image" src="https://github.com/user-attachments/assets/94644117-36a6-4e11-ac3e-4a9f62a85008" />

<img width="1152" height="762" alt="image" src="https://github.com/user-attachments/assets/c4794bf1-b0e4-4fd2-a3ca-d132d3fddad8" />

## Important notice 
## Why we add feedback routs to our control system
### In this HiL model, the load resistance 𝑅 Last depends on the actual output voltage Ua, because light bulbs are non-linear resistors (their resistance increases as they heat up).
### This means: 
#### Ua is used to calculate 𝑅 Last.
#### 𝑅 Last is used to calculate Ua.
### That’s a direct algebraic loop in Simulink. Simulink doesn’t like that, because it means “solve an equation that depends on itself, instantly.” To break that loop, we need to add dynamics (time dependence).

<img width="959" height="413" alt="image" src="https://github.com/user-attachments/assets/7b92fb60-9aff-454b-a7de-b24caeb6d9a7" />

<img width="954" height="374" alt="image" src="https://github.com/user-attachments/assets/6a2f01f0-06db-441a-b847-045946890ed9" />

<img width="871" height="616" alt="image" src="https://github.com/user-attachments/assets/b13af1b6-9654-4bc6-8a1f-15fdbe23c5a6" />

# Variant 2:
### Instead of using equations for the DC-DC converter, we measured data:
### Inputs: PWM [%] and switching frequency [Hz]
### Output: average output voltage Ua
###   - That measurement is stored as a table.
###   - Simulink then reads the table: for any PWM and frequency, it outputs the correct Ua . 
###   - You can have two tables: one for 1 bulb and one for 2 bulbs.



