% Datos del sistema
m = 100;                  % Masa total plataforma + usuario en kilogramos
mu = 0.57;                % Coeficiente de fricción
g = 9.81;                 % Aceleración debida a la gravedad
alpha = deg2rad(30);      % Ángulo del plano inclinado en radianes

v_cremallera = 0.15;       % Velocidad constante deseada en m/s
% Resolver la EDO para el movimiento
t = linspace(0, 1000, 1000);  % Intervalo de tiempo de 0 a 30 segundos
x0 = [0; 0.15];            % Valores iniciales: x(0) = 4 m y x'(0) = 0.15 m/s
options = odeset('RelTol', 1e-9, 'AbsTol', 1e-9);  % Opciones de precisión

% Definir la función que representa la EDO
sistema = @(t, x) [x(2); (calcularFuerzaMotor(x(2)) - mu * m * g * cos(alpha) - m * g * sin(alpha)) / m];

% Resolver la EDO
[t, sol] = ode45(sistema, t, x0, options);

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
