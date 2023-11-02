%aplicar la regla de trapecios en x y la del punto medio en y .
a = 1;
b = 3;
c = 2;
d = 4;
f = @(x,y) x.^2 + y.^2;
I = (b-a)*(d-c)*((f(a,(c+d)/2) + f(b,(c+d)/2))/2);
disp(I)
% aplicar la regla de trapecios en y y la del punto medio en x
a = 1;
b = 3;
c = 2;
d = 4;
f = @(x,y) x.^2 + y.^2;
I = (b-a)*(d-c)*((f((a+b)/2,c) + f((a+b)/2,d))/2);
disp(I)
%Regla de Gauss-Legendre de 1 nodo en la variable x y regla de los trapecios en la variable y
a = 1;
b = 3;
c = 2;
d = 4;
f = @(x,y) x.^2 + y.^2;
w = 2;
x = 0;
I = (b-a)*(d-c)*(w * f((b-a)/2 * x + (a+b)/2, c) + w * f((b-a)/2 * x + (a+b)/2, d))/2;
disp(I)