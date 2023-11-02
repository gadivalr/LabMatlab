a = 1;
b = 3;
w = [1 1];
x = [-1/sqrt(3) 1/sqrt(3)];
f = @(x) x.^2 + 1;
I = (b-a)/2 * sum(w .* arrayfun(f, (b-a)/2 * x + (a+b)/2));
disp(I)