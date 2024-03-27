param n;
param t{1..n};
param y{1..n};
var x{1..3};

minimize f:
 sum{i in 1..n} (x[2]/(1+x[2]*x[3]*exp(1)^(-x[1]*t[i])) - y[i])^2