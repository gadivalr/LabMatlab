f = @(x) sin(x);
a = 0;
b = 1;
for n = [2 4 8]
    h = 1/n;
    x = a:h:b;
    y = f(x);
    I_midpoint = h * sum(f((x(1:end-1) + x(2:end))/2));
    I_trapezoidal = h/2 * (y(1) + 2*sum(y(2:end-1)) + y(end));
    fprintf('n = %d, puntoMedio = %.8f, Trapecios = %.8f\n', n, I_midpoint, I_trapezoidal)
end
I_exact = integral(f,a,b);