f = @(x) sin(x);
a = 0;
b = 1;
I_exact = integral(f,a,b);
for n = [2 4 8]
    h = 1/n;
    x = a:h:b;
    y = f(x);
    I_midpoint = h * sum(f((x(1:end-1) + x(2:end))/2));
    I_trapezoidal = h/2 * (y(1) + 2*sum(y(2:end-1)) + y(end));
    RM = abs(I_exact - I_midpoint);
    RT = abs(I_exact - I_trapezoidal);
    fprintf('n = %d, h = %.8f, RM = %.8f, RT = %.8f\n', n, h, RM, RT)
end
