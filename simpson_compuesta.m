function I_simpson_compuesta = simpson_compuesta(f, a, b, n)
    % f: función a integrar
    % a: límite inferior del intervalo de integración
    % b: límite superior del intervalo de integración
    % n: número de segmentos (debe ser un número par)
    
    % Verificar que n sea un número par
    % Calcular el tamaño de paso h
    h = (b - a) / n;
    
    % Crear un vector x con los puntos equidistantes en el intervalo
    x = a:h:b;
    
    % Evaluar la función en los puntos del vector x
    y = f(x);
    
    % Calcular la aproximación de la integral usando la regla compuesta de Simpson
    I_simpson_compuesta = (h / 3)*(y(1) + 4*(sum(y(2:2:end-1))) + 2 *(sum(y(3:2:end-2))) + y(end));
end

