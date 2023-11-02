function plataforma_salvaescaleras()
    % Parámetros
    masa = 230; % Masa total (kg)
    velocidad_avance = 0.15; % Velocidad de avance constante (m/s)
    angulo_pendiente = deg2rad(30); % Ángulo de la pendiente (radianes)
    
    % Coeficientes de fricción y aceleración debidos a la gravedad
    mu = 0.1; % Coeficiente de fricción
    g = 9.81; % Aceleración debida a la gravedad (m/s²)
    
    % Inicialización
    tiempo_simulacion = 10; % Duración de la simulación (s)
    num_puntos = 1000; % Número de puntos de tiempo
    tiempo = linspace(0, tiempo_simulacion, num_puntos);
    y = zeros(1, num_puntos); % Altura de la plataforma (m)
    
    % Resuelve la EDO numéricamente
    for i = 2:num_puntos
        % Fuerza debida al motor (constante)
        F_motor = masa * velocidad_avance^2 / angulo_pendiente;
        
        % Fuerza de resistencia
        F_resistencia = mu * masa * g * cos(angulo_pendiente);
        
        % Fuerza debida a la pendiente
        F_pendiente = masa * g * sin(angulo_pendiente);
        
        % Ecuación de movimiento (EDO de segundo orden)
        y_dot_dot = (F_motor - F_resistencia - F_pendiente) / masa;
        
        % Actualización de la posición y la velocidad
        y(i) = y(i-1) + velocidad_avance * tiempo_simulacion + 0.5 * y_dot_dot * tiempo_simulacion^2;
    end
    
    % Gráfica del movimiento de la plataforma
    plot(tiempo, y);
    xlabel('Tiempo (s)');
    ylabel('Altura de la plataforma (m)');
    title('Movimiento de la Plataforma Salvaescaleras');
end
