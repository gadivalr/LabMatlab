a = 0;
b = pi/2;
c = 0;
d = pi/2;
e = 1;
f = 3;
g = @(x,y,z) sin(x.*y.*z);
I1 = (b-a)*(d-c)/4 * g((a+b)/2,(c+d)/2,e);
I2 = (b-a)*(d-c)/4 * g((a+b)/2,(c+d)/2,f);
I = (f-e)/2 * (I1 + I2);
disp(I)
