function y = lagrange(nodos,x)
% Esta funcion evalua los polinomios de lagrange asociados a cada punto almacenado en nodos 
% en el punto x, estos valores son almacenados en un vector y.
% "nodos" es un vector y "x" es un numero real.

n=length(nodos);
y=ones(1,n);

for j=1:n
    for i=1:n
        if i~=j
            y(j)=y(j)*((x-nodos(i))/(nodos(j)-nodos(i)));
        end
    end
end

end