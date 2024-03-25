param N;

var x{1..N};
var y{1..N};
var z{1..N};

minimize energy: sum{i in 1..N-1, j in i+1..N} ((x[i]-x[j])^2+(y[i]-y[j])^2+(z[i]-z[j])^2)^(-1/2);

subject to normone {i in 1..N}:
    x[i]^2 + y[i]^2 + z[i]^2 = 1;