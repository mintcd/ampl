# Find the smallest eigenvalue of a symmetric matrix
param n;
param A {i in 1..n, j in i..n}; # upper triangular part
var x {1..n} := 1; # set the initial values of x
var y {i in 1..n} = A[i,i]*x[i] + 2*sum {j in i+1..n} A[i,j]*x[j];
minimize quadratic: sum {i in 1..n} x[i]*y[i];
subject to normone: sum {i in 1..n} x[i]^2 = 1;