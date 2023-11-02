a = 1;
b = 3;
c = 2;
d = 4;
f = @(x,y) x.^2 + y.^2;
I1 = (b-a)/2 * (f(a,(c+d)/2) + f(b,(c+d)/2));
I = (d-c)/2 * (I1 + f((a+b)/2,d));
disp(I)