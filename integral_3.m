f = @(x) sin(x);
a = 0;
b = 1;
I_exact = integral(f,a,b);
for n = [2 3 4]
    h = 1/(2*n);
    x = a:h:b;
    y = f(x);
    I_simpson = h/3 * (y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) + y(end));
    RS = abs(I_exact - I_simpson);
    fprintf('n = %d, h = %.8f, I_simpson = %.8f, RS = %.8f\n', n, h, I_simpson, RS)
end