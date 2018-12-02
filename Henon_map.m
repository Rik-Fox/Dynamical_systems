function [x,y]=Henon_map(a,b,N)
%This function takes in the a and b values for the Henon map and
%iterates (0.1,0) N times.
x=zeros(1,N);
y=zeros(1,N);
x(1)=0.1;
y(1)=0;
for i=2:N
    x(i)=a+b*y(i-1)-(x(i-1))^2;
    y(i)=x(i-1);
end
end
