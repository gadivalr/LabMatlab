function [speed_command, direction] = controller(height_desired, height_current, angle_desired, angle_current)
    % Controlador simple: mantiene la altura constante y ajusta el ángulo
    speed_command = 0.15; % Velocidad de referencia (0-100%)
    direction = sign(height_desired - height_current); % Subir o bajar

    % Puedes implementar lógica de control más compleja según tus requisitos.
end
