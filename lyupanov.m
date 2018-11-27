function dfdx = lyupanov(x,a,flag,n)

dfdx = zeros(1,n);


dfdx = cumsum(-a.*exp(-a.*(x.^2)));
