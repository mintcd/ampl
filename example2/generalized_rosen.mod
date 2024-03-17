# Generalized Rosenbrock function
param n;
var x{1..n};
minimize f:
sum {k in 1..n-1} ((x[k]-1)^2 + 100*(x[k+1]-x[k]^2)^2);