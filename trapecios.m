function I = trapecios(f,a,b,n)
%Esta funcion calcula una aproximacion de la integral de f desde a hasta b 
% usando la regla del trapecio compuesto con n-1 subintervalos 

I=0;

% nodos de la regla de integración
x = linspace(a,b,n); 

%tamaño de paso
h=x(2)-x(1);

% Calculo de la regla del trapecio
for i=1:(n-1)
    I =I + h*(f(x(i))+f(x(i+1)))/2;
end

end
