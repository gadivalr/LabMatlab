function [torque, motor_speed] = silla_salvaescaleras_model(voltage_dc)
    % Parámetros del motor
    rated_power = 0.58; % Potencia nominal en kW
    motor_efficiency = 0.85; % Eficiencia del motor
    motor_power_w = rated_power * 1000; % Potencia en vatios

    % Parámetros del sistema de tracción
    velocidad_avance = 0.15; % Velocidad de avance constante en m/s
    pendiente_maxima = deg2rad(30); % Pendiente máxima en radianes
    carga_maxima = 230; % Carga máxima en kg
    masa_silla = 100; % Masa de la silla en kg (como ejemplo)
    
    % Cálculo de la fuerza requerida para vencer la pendiente máxima
    fuerza_pendiente = masa_silla * 9.81 * sin(pendiente_maxima);

    % Cálculo del torque requerido en el sistema de tracción
    torque = fuerza_pendiente * velocidad_avance;

    % Cálculo de la potencia requerida para vencer la pendiente
    power_required_w = torque * velocidad_avance;

    % Eficiencia del motor
    power_motor_w = power_required_w / motor_efficiency;

    % Cálculo de la velocidad del motor en función de la potencia
    motor_speed = power_motor_w / motor_power_w;
end
