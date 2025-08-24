# -Parameteroptimierung (Parameter optimization)
## After the first simulations, we notice small differences between simulation and real measurements. Why? We ignored some real effects (e.g., cable losses, diode nonlinearities). The real components (L, C, R) are never exactly equal to the datasheet nominal values.
## Solution: Adjust the parameters in the model so simulation matches measurements better.

# -Einfaches Permutationsverfahren (Simple permutation method)
## One way: try out different parameter combinations. To do this systematically, we need a cost function = a way to measure how good the match is.
### Common cost function: sum of squared errors

<img width="702" height="292" alt="image" src="https://github.com/user-attachments/assets/b6c98c27-2b66-4fff-9179-d7dcf454f234" />

# -Beispiel: Anwendung (Example application)

<img width="639" height="401" alt="image" src="https://github.com/user-attachments/assets/0d82fd91-e004-4cd0-a792-1061146ac706" />

# -Result of optimization
## The plot shows output voltage Ua of the DC-DC converter. Blue = measured values, red = optimized simulation.After optimization, the simulation curve overlaps the measurement much better.

<img width="1287" height="708" alt="image" src="https://github.com/user-attachments/assets/edb7de32-fedc-4f51-a186-07f74dcf7729" />

# -Final optimized parameters (table)

## The table shows results for different measurement cases (different PWM, different bulb loads).
## These values are slightly different from the datasheet but fit the real system better.
<img width="1287" height="534" alt="image" src="https://github.com/user-attachments/assets/070f7845-3fa3-4da4-8a6b-f9453e75d964" />
