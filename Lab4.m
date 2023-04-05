%Estimación para la integral
f=@(x) x^2;
a=0;
b=3;
n=10;
I= trapecios(f,a,b,n);
N=[10,20,40,80];
