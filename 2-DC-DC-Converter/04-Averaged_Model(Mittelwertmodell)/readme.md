# Why averaged model? 


## Two poles explained

<img width="953" height="318" alt="image" src="https://github.com/user-attachments/assets/4ce4163b-c271-47f0-808e-36b3223632cb" />

## Why is this a problem in HiL?
<img width="699" height="124" alt="image" src="https://github.com/user-attachments/assets/61567eae-846c-4a1e-8466-dfdb01460558" />

# So ...
### Most voltage controllers care about the slow, average settling of  Ua not the microsecond-scale ripple. The average model captures what the controller needs while being light enough to run on the ESP32 in HiL.
