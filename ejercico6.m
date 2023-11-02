x=[0, 500, 1000, 1500, 2000, 2500, 3000];
y= [288.16, 284.91, 281.66, 278.41, 275.16, 271.91, 268.66];
xx = linspace(0,3000);
yy = spline(x,y,xx);
plot(x,y,'o',xx,yy)
legend('Interpolation points','Cubic spline')
T = spline(x,y,800);
