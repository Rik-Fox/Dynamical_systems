function [x,y]=Q4_map(a,b,c,d,N)
%This function takes in the a and b values for the Henon map and
%iterates (0.1,0) N times.
x=zeros(1,N);
y=zeros(1,N);
x(1)=0.1;
y(1)=0;
for i=2:N
    x(i)=(x(i-1)^2) - (y(i-1)^2) + (a*x(i-1)) + (b*y(i-1));
    y(i)=(2*x(i-1)*y(i-1)) + (c*y(i-1)) + (d*y(i-1));
end
end
