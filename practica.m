%Evaluando polinomio c(x)  = 3x^4 -7x^3 +2x^2 +x +1, en x= 2.5

c=[3 -7 2 1 1];
xi=2.5;
yi= polyval(c,xi);

%Ajuste de polinomios
%Puntos:
x=[1.1, 2.3, 3.9, 5.1];
y=[3.887, 4.276, 4.651, 2.117];
%Luego:
a=polyfit(x,y,length(x)-1);
%Donde a es un vector de los coeficientes del polinomio.
% polyfit es importante, y se le asigna el valor length(x)-1.
% porque el orden del polinomio es igual al número de puntos de 
%datos menis uno.
%El polinomio determinado aquí es: 
% p(x)= -0.2015x^3 + 1.4385x^2 - 2.7477x + 5.4370
% si queremos evaluar este polinomio en xi:
% usamos yi=polyval(a,xi) que nos da = 4.4108

%---------------------------------------------------------
%       DIFERENCIACIÓN E INTEGRACIÓN
%---------------------------------------------------------
% Si los coeficientes de la ecuación c, están dados por un 
%vector filal c, los coeficientes de y pueden calcularse con
% polyint(argumento) y la derviada polyder(argumento)
d=polyint(c); 
b=polyder(c);