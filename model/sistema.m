% Definimos la función que representa la EDO
function dxdt = sistema(~, x)
    m = 100;                % Masa total en kilogramos
    mu = 0.57;              % Coeficiente de fricción
    g = 9.8;                % Aceleración debida a la gravedad
    alpha = deg2rad(30);  % Ángulo del plano inclinado en radianes
    
    % Nueva velocidad deseada
    desired_velocity = 0.2;  % m/s

    % Resolver para el nuevo valor de TwRw
    TwRw = mu * m * g * cos(alpha) + m * g * sin(alpha) + m * desired_velocity / cos(alpha);


    dxdt = zeros(2, 1);
    dxdt(1) = x(2);
    dxdt(2) = (TwRw - mu * m * g * cos(alpha) - m * g * sin(alpha)) / m;
end
