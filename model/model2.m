% Parámetros del generador hidráulico
I = 100;            % Momento de inercia (kg·m²)
r = 2;              % Radio de las palas (metros)
eta_turbine = 0.8;  % Eficiencia de la turbina (ajusta según tus necesidades)
eta_generator = 0.9; % Eficiencia del generador (ajusta según tus necesidades)
g = 9.81;           % Aceleración debido a la gravedad (m/s²)
rho = 1000;         % Densidad del agua (kg/m³)
B = 0.1;            % Coeficiente de fricción o resistencia (ajusta según tus necesidades)

% Condiciones iniciales
h0 = 50;            % Altura inicial del agua (metros)
omega0 = 1;          % Velocidad angular inicial (rad/s)
P_target = 500;      % Potencia eléctrica objetivo (vatios)

% Otros parámetros
tspan = [0, 100];    % Intervalo de tiempo de simulación (ajusta según tus necesidades)

% Función para caudal de agua Q(h) usando la ecuación de Bernoulli
Q = @(h) sqrt(2 * g * h / (0.5 * rho * (r * omega0)^2));

% Ecuación diferencial para velocidad angular (omega) y nivel de agua (h)
ODE_omega = @(t, omega, h) (eta_turbine * Q(h) * g * r - B * omega) / I;
ODE_h = @(t, omega, h) -Q(h);

% Inicialización de matrices para almacenar resultados de potencia
t_values = [];
omega_values = [];
h_values = [];
P_values = [];

% Bucle de avance temporal
t = tspan(1);
Y = [omega0; h0];
while t < tspan(2)
    t_values(end+1) = t;
    omega_values(end+1) = Y(1);
    h_values(end+1) = Y(2);
    
    % Cálculo de la potencia de salida
    P = eta_generator * eta_turbine * Q(Y(2)) * g * r * Y(1);
    P_values(end+1) = P;  % Almacenar el valor de la potencia
    
    % Ajustar la velocidad angular en función de la potencia
    delta_P = P - P_target;
    Y(1) = Y(1) - delta_P / I;
    
    % Actualizar el nivel de agua utilizando ode45
    [t_ode45, h_ode45] = ode45(@(t,h) ODE_h(t, Y(1), h), [t, t+0.01], Y(2));
    Y(2) = h_ode45(end);  % Actualizar el nivel de agua con el último valor de ode45
    
    % Actualizar el tiempo
    t = t + 0.01;
end

% Mostrar los resultados
fprintf('Velocidad angular final: %.2f rad/s\n', omega_values(end));
fprintf('Nivel de agua final: %.2f metros\n', h_values(end));
fprintf('Potencia eléctrica final: %.2f Watts\n', P);

% Gráfico de velocidad angular y nivel de agua en función del tiempo
subplot(2, 1, 1);
plot(t_values, omega_values);
xlabel('Tiempo (s)');
ylabel('Velocidad Angular (rad/s)');
title('Velocidad Angular vs. Tiempo');
grid on;

subplot(2, 1, 2);
plot(t_values, h_values);
xlabel('Tiempo (s)');
ylabel('Nivel de Agua (m)');
title('Nivel de Agua vs. Tiempo');
grid on;
   % Gráfico de potencia en función del tiempo
figure;
plot(t_values, P_values);
xlabel('Tiempo (s)');
ylabel('Potencia (Watts)');
title('Potencia Eléctrica vs. Tiempo');
grid on;