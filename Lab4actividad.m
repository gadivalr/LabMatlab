f=@(x) exp((-x.^2)/2);
a= -2;
b= 1;
n= 20;
I=simpson(f,a,b,n);
%  117.8333
%  117.8333