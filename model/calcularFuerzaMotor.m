function F_motor = calcularFuerzaMotor(v)
    v_cremallera=0.15;
    if v > v_cremallera
        % Velocidad excede la deseada, motor debe frenar
        F_motor = -974.75;  % Fuerza de frenado
    else
        % Velocidad es menor que la deseada, motor debe acelerar
        F_motor = 974.75;   % Fuerza de aceleración
    end
end