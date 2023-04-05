function I = simpson(a,b,f,N)

% Esta funcion calcula la aproximacion a la integral entre a y b de la
% funcion f usando la regla compuesta de simpson con N subintervalos.

% longitud de los subintervalos
h = (b-a)/N;

% Particion de [a,b]
x = a:h:b; % punto_inicial:incremento:punto_final

% Inicializamos la variable de salida
I = 0;

% Ciclo for para sumar las contribuciones de cada subintervalo
for i = 1:N
    I = I + (h/6)*(f(x(i)) + 4*f((x(i)+x(i+1))/2) + f(x(i+1)));
end

end