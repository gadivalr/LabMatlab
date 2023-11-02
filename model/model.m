I = 100;          % Momento de inercia (kg·m²)
r = 1;         % Radio de las palas (metros)
eta = 0.5;       % Eficiencia global
g = 9.81;        % Aceleración debido a la gravedad (m/s²)
rho = 1000;      % Densidad del agua (kg/m³)
B = 0.6;         % Coeficiente de fricción o resistencia (ajusta según tus necesidades)
R = 1;           % Resistencia eléctrica del generador (ohmios, ajusta según tus necesidades)

% Condiciones iniciales
h0 = 100;            % Altura inicial (metros)
omega0 = 10;         % Velocidad angular inicial (rad/s)
V_objetivo = 100;    % Voltaje objetivo (V)

% Función para el caudal de agua Q(h) usando la ecuación de Bernoulli
Q = @(h) sqrt(2 * g * h / (0.5 * rho * (r * omega0)^2));

% Ecuación diferencial para la velocidad angular (omega) con torque
ODE = @(t, omega) (eta * Q(h0) * h0 * g * r - B * omega) / I;

% Resolver la EDO para encontrar la velocidad angular en función del tiempo
t_span = [0, 360];  % Rango de tiempo más corto
[t, omega] = ode45(ODE, t_span, omega0);

% Calcular la fuerza electromotriz (EMF) en función de la velocidad angular (omega)
K = I * R / omega0;  % Ajusta la constante K según tus necesidades
EMF = K * omega - I * R;


% Calcular el voltaje en función del tiempo en el circuito externo
V = @(t) EMF;


% Encontrar el tiempo cuando el voltaje alcanza el objetivo
tiempo_objetivo = interp1(V(t), t, V_objetivo);

% Mostrar el resultado
fprintf('Tiempo necesario para alcanzar %d V: %.2f segundos\n', V_objetivo, tiempo_objetivo);
% Gráfico de la velocidad angular y el voltaje en función del tiempo
figure;
subplot(2,1,1)
plot(t, omega)
ylabel('Velocidad Angular (rad/s)')
title('Velocidad Angular en función del Tiempo')
legend('Velocidad Angular')
grid on

subplot(2,1,2)
plot(t, V(t))
ylabel('Voltaje (V)')
xlabel('Tiempo (s)')
title('Voltaje en función del Tiempo')
legend('Voltaje')
grid on