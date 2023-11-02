x = [0 0.5 1 1.5 2];
y = (x + 2).^2 - 0.5*exp(x);
xx = linspace(0,2);
yy = spline(x,y,xx);
plot(x,y,'o',xx,yy)
hold on
fplot(@(x) (x + 2).^2 - 0.5*exp(x), [0 2])
legend('Interpolation points','Cubic spline','Function f')
hold off