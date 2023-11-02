%volumen  de  una  esfera  de  radio  2  utilizando  reglas  de  cuadratura
%para su aproximación 
%Usando coordenadas Esfericas :
f = @(r,phi,theta) r.^2 .* sin(phi);
a = 0;
b = 2*pi;
c = 0;
d = pi;
e = 0;
g = 2;
V = integral3(f,e,g,c,d,a,b)