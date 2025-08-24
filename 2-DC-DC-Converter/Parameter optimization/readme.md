# -Parameteroptimierung (Parameter optimization)
## After the first simulations, we notice small differences between simulation and real measurements. Why? We ignored some real effects (e.g., cable losses, diode nonlinearities). The real components (L, C, R) are never exactly equal to the datasheet nominal values.
## Solution: Adjust the parameters in the model so simulation matches measurements better.

# -Einfaches Permutationsverfahren (Simple permutation method)
## One way: try out different parameter combinations. To do this systematically, we need a cost function = a way to measure how good the match is.
### Common cost function: sum of squared errors
