
% Valores iniciales y el intervalo de tiempo para la solución
x0 = [0; 0.15];                % Valores iniciales: x(0) = 0 m y x'(0) = 0 m/s
t = linspace(0, 15, 1000);  % Intervalo de tiempo de 0 a 15 segundos


% Resolver la EDO
options = odeset('RelTol', 1e-6, 'AbsTol', 1e-9);  % Opciones de precisión
[t, sol] = ode45(@sistema, t, x0, options);


% Obtener el valor de x en t=15 segundos
x_final = sol(end, 1);
fprintf('El valor de x(15) es aproximadamente: %.2f metros\n', x_final);

% Graficar la posición en función del tiempo
subplot(2,1,1);
plot(t, sol(:, 1));
xlabel('Tiempo (s)');
ylabel('Posición (m)');
title('Posición en función del tiempo');
grid on;

% Graficar la velocidad en función del tiempo
subplot(2,1,2);
plot(t, sol(:, 2));
xlabel('Tiempo (s)');
ylabel('Velocidad (m/s)');
title('Velocidad en función del tiempo');
grid on;