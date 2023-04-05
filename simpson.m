function I = simpson(f,a,b,n)
%Esta funcion calcula una aproximacion de la integral de f desde a hasta b
%usando la regla de simpson compuesta con 2*(n-1) subintervalos

% Ii=0; Ip=0;
I=0;
%Nodos de integracion
x=linspace(a,b,n);

%tamaño de paso
h=x(2)-x(1);

% Calculo de la regla de Simpson
for i=1:(n-1)
    xp=(x(i)+x(i+1))/2;
    I=I+ (h/6)*(f(x(i))+4*f(xp)+f(x(i+1)));
end


end