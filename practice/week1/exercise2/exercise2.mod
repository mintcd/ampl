param n;

param A {1..n, 1..n};

var x{1..n};

maximize eigenval: sum{i in 1..n} (x[i]^2 *(sum{j in 1..n} A[i,j]));

subject to normone: sum{i in 1..n} x[i]^2 = 1;
