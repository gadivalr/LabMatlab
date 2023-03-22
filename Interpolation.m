x=[3 12 15 18 25];
y=[10 14 29 38 50];
plot(x,y,'*')
grid on
p= polyfit(x,y,5);
%[1.9464 -0.2175] = 1.9464x - 0.2175 ecuacion de salida
% ejemplo [4 5 6 1]= 4x^3 + 5x^2 +6x +1
x1=3:0.1:25;
y1=polyval(p,x1);
hold on
plot(x1,y1)