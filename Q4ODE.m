function  f = Q4ODE(t,init,flag,a,b,c,d);

f= zeros(2,1);
x = init(1);
y = init(2);

f(1) = (x^2) - (y^2) + (a*x) + (b*y);
f(2) = (2*x*y) + (c*y) + (d*y);

