T = [300, 400, 500, 600, 700, 800, 900, 1000,1100];
E = [0.024, 0.035,0.046, 0.058,0.067,0.083,0.097,0.111, 0.125];
p = polyfit(T,E,length(T)-1);
x = 450;
y = polyval(p,x);
s= spline(T,E);

abs= abs(ppval(s,380)-polyval(p,380));

