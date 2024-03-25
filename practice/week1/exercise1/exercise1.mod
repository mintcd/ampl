param n;

var x {1..n};

minimize f:
    sum {i in 1..(n-1)} (100*(x[i]^2 - x[i+1])^2 + (x[i] - 1)^2);

subject to equalities {k in 1..(n-2)}:
    3*x[k+1]^3 + 2*x[k+2] - 5 + sin(x[k+1]-x[k+2])*sin(x[k+1]+x[k+2]) + 4*x[k+1] -x[k]*exp(x[k]-x[k+1]) -3 = 0