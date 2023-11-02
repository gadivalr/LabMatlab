% Simulador 
close all 
clear 
clc 
tspan = [0,15]; % rango de tiempo (15 segundos) 
y0 = [0;0]; % condiciones iniciales [posicion;velocidad] 
[t,y] = ode45('plataforma',tspan,y0); % solución mediante integración numérica 
size(t) % numero de pasos evaluados 
distancia = y(:,1); % distancia 
subplot(211),plot(t,distancia,'k') 
grid on,xlabel('tiempo (s)'),ylabel('distancia (metros)'),title('recorrido') 
velo = y(:,2); % velocidad 
subplot(212),plot(t,velo,'k') 
grid on,xlabel('tiempo (s)'),ylabel('velocidad (m/s)'),title('Velocidad ')