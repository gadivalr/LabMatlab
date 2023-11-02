% Parámetros del modelo
K = 0.9;  % Coeficiente de rendimiento de la turbina
Q = 0.1;  % Caudal de agua (m^3/s)
D = 1.0;  % Diámetro efectivo de las cucharas de la turbina (m)
I = 100;  % Momento de inercia del rotor (kg*m^2)
rho = 1000;  % Densidad del agua (kg/m^3)
g = 9.81;  % Aceleración debida a la gravedad (m/s^2)
H = 100;  % Altura de caída del agua (m)
alpha = deg2rad(45);  % Ángulo de impacto del chorro de agua (grados a radianes)
P_inyector = 100000;  % Presión del inyector (Pa)
A = pi * (D/2)^2;
% Parámetro de apertura de la boquilla
apertura_boquilla = 1;  % valor  entre 0 y 1

% Condiciones iniciales
N0 = 0;  % Velocidad angular inicial del rotor (rad/s)

% Tiempo de simulación
tspan = [0 10];  % Intervalo de tiempo de simulación (segundos)

% Constante de tiempo de la inercia del rotor
tau = I / 100;  % Ajusta el valor según tus necesidades

% Función que define la EDO*
ode = @(t, N) (2 * K * P_inyector *cos(alpha)*Q* H * apertura_boquilla) / (sqrt(g * H) * A * rho) - N/ tau;

% Resolver la EDO
[t, N] = ode45(ode, tspan, N0);

% Gráfico de la velocidad angular del rotor
figure;
plot(t, N);
xlabel('Tiempo (s)');
ylabel('Velocidad Angular (rad/s)');
title('Velocidad Angular del Rotor de la Turbina Pelton');

% Parámetros:
% - K: Coeficiente de rendimiento de la turbina
% - Q: Caudal de agua (m^3/s)
% - D: Diámetro efectivo de las cucharas de la turbina (m)
% - I: Momento de inercia del rotor (kg*m^2)
% - rho: Densidad del agua (kg/m^3)
% - g: Aceleración debida a la gravedad (m/s^2)
% - H: Altura de caída del agua (m)
% - alpha: Ángulo de impacto del chorro de agua (radianes)
% - P_inyector: Presión del inyector (Pa)

% Variables de entrada:
% - N0: Velocidad angular inicial del rotor (rad/s)
% - apertura_boquilla: Apertura de la boquilla (valor entre 0 y 1)
% - tau: Constante de tiempo de la inercia del rotor

% Variables de salida:
% - t: Tiempo (s)
% - N: Velocidad Angular (rad/s)
