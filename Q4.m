clear variables
set(0,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',14)
options = odeset('RelTol',1e-08,'AbsTol',1e-08);

a = 0.9;
b = -0.6013;
c = 2;
d = 0.5;

N = 1024;

x = zeros(N);
y = zeros(N);

x(1) = 0.1;
y(1) = 0;


for i=2:N
    
    x(i)=(x(i-1)^2) - (y(i-1)^2) + (a*x(i-1)) + (b*y(i-1));
    y(i)=(2*x(i-1)*y(i-1)) + (c*y(i-1)) + (d*y(i-1));
end

figure(1)
plot(x,y)