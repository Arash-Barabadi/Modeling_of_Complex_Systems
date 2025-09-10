# Why averaged model? 


## Two poles explained

<img width="953" height="318" alt="image" src="https://github.com/user-attachments/assets/4ce4163b-c271-47f0-808e-36b3223632cb" />

## Why is this a problem in HiL?
<img width="699" height="124" alt="image" src="https://github.com/user-attachments/assets/61567eae-846c-4a1e-8466-dfdb01460558" />

# So ...
### Most voltage controllers care about the slow, average settling of  Ua not the microsecond-scale ripple. The average model captures what the controller needs while being light enough to run on the ESP32 in HiL.

# What does the averaged model do with these poles?
### It removes the fast pole (high-frequency switching LC dynamics).
### It often even ignores the second pole and just keeps the static gain (P-element).
### This makes the model much simpler: instead of oscillations, you just get the average DC voltage response.
# What is the deduction process of math of the P-gain element?
### Transfer function from input voltage 𝑈 to output voltage Ua
<img width="945" height="80" alt="image" src="https://github.com/user-attachments/assets/f117a417-2ccb-4651-8dc3-cfa899c0c48a" />

### Normalize denominator → standard second-order form...

### Compare with standard PT-2 form:
<img width="646" height="274" alt="image" src="https://github.com/user-attachments/assets/54e1d07a-9173-4578-8091-49b60cbdb63a" />

<img width="655" height="485" alt="image" src="https://github.com/user-attachments/assets/237a3821-a5b0-4324-a988-865ec0564c6f" />

# Therefore:
### We keep only the static gain
<img width="896" height="137" alt="image" src="https://github.com/user-attachments/assets/d96d897e-27c7-4545-88c3-455d976b477d" />

### We know that: 
<img width="405" height="59" alt="image" src="https://github.com/user-attachments/assets/18b97768-674f-4382-9dd8-eb58aacd0712" />

### then...
<img width="417" height="70" alt="image" src="https://github.com/user-attachments/assets/997824be-d70c-4312-9ae8-8028965783eb" />

<img width="712" height="260" alt="image" src="https://github.com/user-attachments/assets/02a82d9b-1efa-4b55-8320-769cb39b7704" />


