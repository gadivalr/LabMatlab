% Parámetros del sistema
m1 = 25;
m2 = 25;
k1 = 1;
k2 = 1;
b1 = 0.1;
b2 = 0.1;
k = 0.5; % Constante de acoplamiento

% Condiciones iniciales
x1_0 = 1;
x2_0 = -1;
v1_0 = 0;
v2_0 = 0;

% Sistema de EDOs
ode = @(t, y) [y(3);
               y(4);
               (1/m1) * (-k1 * y(1) - b1 * y(3) + k * (y(2) - y(1)));
               (1/m2) * (-k2 * y(2) - b2 * y(4) + k * (y(1) - y(2)))];

% Tiempo de simulación
tspan = [0 100]; % Desde t=0 hasta t segundos

% Condiciones iniciales
y0 = [x1_0; x2_0; v1_0; v2_0];

% Resolución de las EDOs
[t, y] = ode45(ode, tspan, y0);

% Extraer posiciones de las masas
x1 = y(:, 1);
x2 = y(:, 2);

% Visualización de las posiciones en función del tiempo
figure;
plot(t, x1, 'b', 'LineWidth', 2);
hold on;
plot(t, x2, 'r', 'LineWidth', 2);
title('Osciladores Armónicos Acoplados');
xlabel('Tiempo');
ylabel('Posición');
legend('Masa 1', 'Masa 2');
grid on;
