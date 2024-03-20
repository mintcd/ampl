## Exercise 1: 
The results are found in solution-150.out and solution-300.out

## Exercise 2: 
Replacing into inequality constraints does not change the optimal value and the optimum, because it is found on the boundary.
I could not find an open-source solver that is able to solve this problem. KNITRO is commercial, so we can only attach 10 parameters.

## Exercise 5: 
Commercial solvers did not let me solve up to 30. Using the open-source "ipopt", maybe it was unable to solve high-dimensional cases. Or race condition occurred so that the plots were not executed correctly. I am considering using AMPL API from MATLAB.