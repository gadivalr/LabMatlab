function main()
    % Parámetros y constantes
    m = 76;           % Masa del objeto (kg)
    TwRw = 10;        % Fuerza del motor (N)
    Rw = 0.1;         % Radio de la rueda (m)
    mu = 0.1;         % Coeficiente de fricción
    alpha = 30;       % Ángulo del plano inclinado (grados)
    g = 9.81;         % Aceleración debida a la gravedad (m/s^2)

    % Función de la EDO
    function dxdt = edo(t, x)
        dxdt = zeros(2, 1);
        dxdt(1) = x(2);  % dx/dt = velocidad
        dxdt(2) = (1 / m) * (TwRw / Rw - mu * m * g * cosd(alpha) - m * g * sind(alpha));
    end

    % Condiciones iniciales
    x0 = 3.34;          % Posición inicial (metros)
    v0 = 0;             % Velocidad inicial (m/s)
    y0 = [x0; v0];

    % Rango de tiempo
    tspan = [0, 15];  % De 0 a 15 segundos

    % Resolución de la EDO
    [t, y] = ode45(@edo, tspan, y0);

    % Gráficos
    plot(t, y(:, 1));  % Gráfico de la posición
    xlabel('Tiempo (s)');
    ylabel('Posición');
end
