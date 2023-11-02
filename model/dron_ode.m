% Parámetros del objeto y condiciones iniciales
m = 77;            % Masa del objeto (kg)
Tw = 2;           % Torque 
Rw = 0.1;         % 
mu = 0.2;         % Coeficiente de fricción
g = 9.81;         % Aceleración debida a la gravedad (m/s^2)
alpha = 30;       % Ángulo del plano inclinado (grados)

% Condiciones iniciales
x0 = 0;        % Posición inicial (m)
t0 = 0;           % Tiempo inicial (s)
tf = 10;          % Tiempo final (s)

% Resolución de la ecuación de movimiento
odefun = @(t, y) [y(2); (70/m - mu * g * cosd(alpha) -  g * sind(alpha))];
[t, y] = ode45(odefun, [t0, tf], [x0, 0]);

% Extraer resultados
x = y(:, 1);      % Posición en función del tiempo
v = y(:, 2);      % Velocidad en función del tiempo

% Gráfica de la posición y velocidad en función del tiempo
figure;
subplot(2, 1, 1);
plot(t, x);
xlabel('Tiempo (s)');
ylabel('Posición (m)');
title('Posición vs. Tiempo');

subplot(2, 1, 2);
plot(t, v);
xlabel('Tiempo (s)');
ylabel('Velocidad (m/s)');
title('Velocidad vs. Tiempo');
