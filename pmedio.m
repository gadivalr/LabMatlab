function I = pmedio(f,a,b,n)
%Esta funcion calcula una aproximacion de la integral de f desde a hasta b
%usando la regla del punto medio compuesta con n-1 subintervalos

I=0;
%Nodos de integracion
x=linspace(a,b,n);

%tamaño de paso
h=x(2)-x(1);

% Calculo de la regla del punto medio
for i=1:(n-1)
    xp=(x(i)+x(i+1))/2;
    I=I + f(xp); 
end
I=h*I;

end