n = 4;
a = 100;
x = zeros(1, n);

x(1) = -0.775659;
x(2) = 0.613093;
x(3) = 0.382063;
x(4) = 0.145972;

grad_g = zeros(1, n);

grad_g (1) = -2*(1-x(1)) - 2*a*x(1)*(x(2)-x(1)^2);
for k = 2:n-1
  grad_g (k) = 2*a*(x(k)-x(k-1)^2) - 2*(1-x(k)) - 2*a*x(k)*(x(k+1)-x(k)^2);
end
grad_g (n) = 2*a*(x(n)-x(n-1)^2);

disp(grad_g)