% Par�metros del modelo
m = 1; % masa del cuerpo (kg)
g = 9.81; % aceleraci�n de la gravedad (m/s^2)
mu = 0.1; % coeficiente de rozamiento
F = 10; % fuerza del motor (N)
alpha = 30*pi/180; % �ngulo de inclinaci�n (rad)

% Ecuaci�n de la aceleraci�n
a = (F - m*g*(mu*cos(alpha) + sin(alpha)))/m;

% Condiciones iniciales
v0 = 0; % velocidad inicial (m/s)
x0 = 1*sin(alpha); % posici�n inicial (m)

% Tiempo de simulaci�n
t = linspace(0,5,100); % vector de tiempo (s)

% Ecuaci�n de la velocidad
v = v0 + a*t;

% Ecuaci�n de la posici�n
x = x0 + v0*t + 0.5*a*t.^2;

% Gr�fica de la posici�n y la velocidad
figure
subplot(2,1,1)
plot(t,x)
xlabel('Tiempo (s)')
ylabel('Posici�n (m)')
title('Posici�n del cuerpo en el plano inclinado')
grid on

subplot(2,1,2)
plot(t,v)
xlabel('Tiempo (s)')
ylabel('Velocidad (m/s)')
title('Velocidad del cuerpo en el plano inclinado')
grid on