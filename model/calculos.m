% Parámetros del sistema
    g = 9.81;         % Aceleración debida a la gravedad (m/s^2)
    masa_plataforma = 200;  % Masa de la plataforma (kg)
    radio_carrete = 0.1;    % Radio del carrete (m)
    relacion_reduccion = 10; % Relación de reducción de la caja reductora
    voltaje_motor = 12;     % Voltaje del motor DC (V)
    
    % Constantes del motor DC (debe obtenerse de las especificaciones del motor)
    constante_motor = 0.2;  % Nm/A
    resistencia_motor = 1.0; % Ohms
    inductancia_motor = 0.01; % Henrios
    velocidad_nominal_motor = 1000; % Velocidad nominal (rpm)
    
    % Tiempo total para subir y bajar la plataforma (segundos)
    tiempo_total = 15;
    
    % Longitud de la cuerda (suponiendo que está completamente enrollada)
    longitud_cuerda = 2 * pi * radio_carrete * relacion_reduccion;
    
    % Fuerza necesaria para vencer la gravedad y elevar la plataforma
    fuerza_ascenso = masa_plataforma * g / tiempo_total;
    
    % Corriente requerida para generar la fuerza de ascenso
    corriente_ascenso = fuerza_ascenso / (constante_motor * relacion_reduccion);
    
    % Potencia requerida para el ascenso
    potencia_ascenso = corriente_ascenso * voltaje_motor;
    
    % Potencia nominal del motor (suponiendo eficiencia del 80%)
    potencia_nominal_motor = potencia_ascenso / 0.8;
    
    fprintf('Fuerza necesaria para el ascenso: %.2f N\n', fuerza_ascenso);
    fprintf('Corriente requerida para el ascenso: %.2f A\n', corriente_ascenso);
    fprintf('Potencia requerida para el ascenso: %.2f W\n', potencia_ascenso);
    fprintf('Potencia nominal del motor: %.2f W\n', potencia_nominal_motor);