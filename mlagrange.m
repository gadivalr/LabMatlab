% xi f(xi)
% 
function ecuacion=mlagrange(xi,fxi)
n=length(xi);
syms x;
for i=1:n
    Li=1;
    for j=1:n 
        if j~=i
            Li=Li*((x-xi(j))/(xi(i)-xi(j)));
        end
    end
  L(i)=Li;
end

ecuacion=0;
for i=1:n
    ecuacion=L(i)*fxi(i)+ ecuacion;
end
ecuacion=simplify(expand(ecuacion));

end
