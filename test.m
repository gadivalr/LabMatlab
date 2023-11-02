f = @(x) sin(abs(x-1/5));
a = -1;
b = 1;
I_exact = integral(f,a,b);
for N = [5, 10, 15]
    I_simpson=simpsonn(f,a,b,N);
    RS = abs(I_exact - I_simpson);
    h1=1/(2*N);
        fprintf('n = %d, h = %.8f, I_simpson = %.8f, RS = %.8f\n', N, h1, I_simpson, RS)
end