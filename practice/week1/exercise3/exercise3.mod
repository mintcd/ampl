param n;
param A {i in 1..n, j in i..n};
param u {i in 1..n-1, j in 1..n};

var x {1..n} := 1;
var y {i in 1..n} = A[i,i]*x[i] + 2*sum {j in i+1..n} A[i,j]*x[j];

minimize quadratic: sum {i in 1..n} x[i]*y[i];
subject to normone: sum {i in 1..n} x[i]^2 = 1;
subject to ortho {i in {1,n-1}}: sum {j in 1..n} x[j] * u[i,j] = 0;