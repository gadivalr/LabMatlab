function ydot = plataforma(~,y) 
    % Variables
    POS = 1;
    VEL = 2;
    % Parámetros del modelo
    m = 200; % masa de la plataforma (kg)
    h = 1.28; % altura a la que se quiere subir la plataforma (m)
    L = 2.667; % longitud de la rampa por la que se sube la plataforma (m)
    mu = 0.57; % coeficiente de fricción
    g = 9.81; % aceleración de gravedad (m/s^2)

    %Motor DC 48V 100W 2500RPM

    V = 48; % voltaje del motor (V)
    n = 500; % relación de reducción de la caja reductora
    rw = 0.2; % radio del carrete (m)
    Kt = 0.18; % constante de torque del motor (N.m/A)
    Ke = 0.18; % constante de voltaje del motor (V/(rad/s))
    R = 22.86; % resistencia de armadura del motor (ohm)
    
    % Ángulo del plano inclinado
    theta = asin(h / L); % ángulo en radianes

   % Fuerza necesaria para subir la plataforma
    Fp = m * g * sin(theta); % peso proyectado en el plano inclinado
    Ff = mu * m * g * cos(theta); % fuerza de fricción en el plano inclinado
    F = Fp - Ff; % fuerza total en sentido contrario al movimiento


    % Fuerzas
    omega = n * y(VEL) / rw; % velocidad angular del motor
    I = (V - Ke * omega) / R; % corriente del motor
    tw = n * Kt * I; % torque en el eje del carrete
    fmotor = tw / rw; % fuerza del motor proyectada en el plano inclinado
    
    % Fuerza neta
    Fnet = fmotor - F;
    
    % Sistema de ecuaciones
    ydot(POS) = y(VEL); % derivada de la posición
    ydot(VEL) = Fnet / m; % derivada de la velocidad
    
    ydot = [ydot(POS); ydot(VEL)];
end
