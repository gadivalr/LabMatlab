% Parámetros del sistema
m = 225;          % Masa (kg)
g = 9.81;         % Aceleración debida a la gravedad (m/s^2)
P = 0.56 * 1000;  % Potencia del motor (W)
yc = 1.0;         % Posición de cambio de polaridad (m)
theta = deg2rad(30);  % Ángulo de inclinación de la escalera (30 grados)
d = 3.0;          % Longitud del plano inclinado (m)

% Velocidad del motor (asumiendo una velocidad constante)
motor_speed = 0.11;  % Velocidad deseada (m/s)

% Dirección de movimiento (1 para subir, -1 para bajar)
direction = 1;

% Inicializar el controlador
current_position = 0;  % Inicialmente, la plataforma está en la posición más baja

% Definir EDO para el movimiento vertical con control
f = @(t, yv) [yv(2); (m * g * sin(theta) - P * direction) / m];

% Condiciones iniciales
tspan = [0 100];  % Intervalo de tiempo
y0 = 0;          % Posición inicial
v0 = 0;          % Velocidad inicial

% Resolver EDO para el movimiento vertical con control
[t, yv] = ode45(f, tspan, [y0, v0]);

% Combinar resultados
y_total = yv(:, 1);

% Implementar el control durante la simulación
for i = 1:length(t)-1
    % Supervisar la posición actual
    current_position = y_total(i);
    
    % Control para cambiar la dirección en la posición yc
    if current_position >= yc && direction == 1
        direction = -1;  % Cambiar la dirección a bajar
    elseif current_position <= 0 && direction == -1
        direction = 1;   % Cambiar la dirección a subir
    end
    
    % Calcular nueva fuerza basada en la dirección actual
    force = (m * g * sin(theta) - P * direction);
    
    % Actualizar la ecuación diferencial con la nueva fuerza
    f = @(t, yv) [yv(2); force / m];
    
    % Resolver la EDO en un intervalo de tiempo pequeño
    tspan_step = [t(i) t(i+1)];
    [t_step, yv_step] = ode45(f, tspan_step, [y_total(i), yv(i, 2)]);
    
    % Actualizar la posición total
    y_total(i+1) = yv_step(end, 1);
end

% Gráfica del movimiento
plot(t, y_total);
xlabel('Tiempo (s)');
ylabel('Posición Vertical (m)');
title('Movimiento de la Plataforma Salva Escaleras');

