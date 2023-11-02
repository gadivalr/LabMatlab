%gauss-legendre
a = 0;
b = pi/2;
c = 0;
d = pi/2;
e = 1;
f = 3;
w = [1 1];
x = [-1/sqrt(3) 1/sqrt(3)];
g = @(x,y,z) sin(x.*y.*z);
I = (b-a)*(d-c)*(f-e)/8 * sum(sum(sum(w'*w.*w .* arrayfun(g, (b-a)/2 * x + (a+b)/2, (d-c)/2 * x + (c+d)/2, (f-e)/2 * x + (e+f)/2))));
disp(I)