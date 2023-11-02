% Parámetros del modelo
m = 200; % masa de la plataforma (kg)
h = 1.28; % altura a la que se quiere subir la plataforma (m)
L = 2.667; % longitud de la rampa por la que se sube la plataforma (m)
mu = 0.57; % coeficiente de fricción
g = 9.8; % aceleración de gravedad (m/s^2)
V = 48; % voltaje del motor (V)
I = 2.1; % corriente del motor (A)
n = 500; % relación de reducción de la caja reductora
rw = 0.2; % radio del carrete (m)
Kt = 0.18; % constante de torque del motor (N.m/A)
Ke = 0.18; % constante de voltaje del motor (V/(rad/s))
R = 22.86; % resistencia de armadura del motor (ohm)
Ln = 0.1e-3; % inductancia de armadura del motor (H)
% Ángulo del plano inclinado
theta = asin(h / L); % ángulo en radianes
theta_deg = rad2deg(theta); % ángulo en grados

% Fuerza necesaria para subir la plataforma
Fp = m * g * sin(theta); % peso proyectado en el plano inclinado
Ff = mu * m * g * cos(theta); % fuerza de fricción en el plano inclinado
F = Fp + Ff; % fuerza total en sentido contrario al movimiento

