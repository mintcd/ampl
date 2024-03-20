param N;
param pi := 4*atan(1);

var r{1..N};
var theta{1..N};

maximize area: 0.5*sum{i in 1..N-1} (r[i+1]*r[i]*sin(theta[i+1]-theta[i]));

subject to diameter_limit {i in 1..N, j in i+1..N}: 
  r[i]^2+r[j]^2-2*r[i]*r[j]*sin(theta[i+1]-theta[i]) <= 1;

subject to counter_lockwise {i in 1..N-1}:
  theta[i] - theta[i+1] <= 0;

subject to angle_limit {i in 1..N-1}:
  0 <= theta[i] <= pi;

subject to radius_limit {i in 1..N-1}:
  0 <= r[i] <= 1;

subject to boundary_radius:
  r[N] = 0;

subject to boundary_angle:
  theta[N] = pi;
