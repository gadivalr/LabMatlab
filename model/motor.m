

% Condiciones iniciales
y0 = [0; 0]; % posición y velocidad iniciales

% Intervalo de tiempo
tspan = [0, 15]; % segundos

% Solución numérica
[t, y] = ode45(@plataforma, tspan, y0);

% Gráficos 
figure 
subplot (2,1,1) % D
plot ( y(:,1),t) % Grafica la posición en función del tiempo
xlabel ('Posición (m)') % Etiqueta el eje x
ylabel ('Tiempo (s)') % Etiqueta el eje y
title ('Posición de la plataforma en función del tiempo') 

subplot (2,1,2) % Selecciona el segundo subgráfico
plot (t, y(:,2)) % Grafica la velocidad en función del tiempo
xlabel ('Tiempo (s)') % Etiqueta el eje x
ylabel ('Velocidad (m/s)') % Etiqueta el eje y
title ('Velocidad de la plataforma en función del tiempo') 
