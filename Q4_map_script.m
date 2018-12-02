clear all
close all

a=0.3;
b=0.6;
c=2;
d=0.27;

N=10000;

x=zeros(1,N);
y=zeros(1,N);
x(1)=0.1;
y(1)=0.1;
for i=2:N
    x(i)=(x(i-1)^2) - (y(i-1)^2) + (a*x(i-1)) + (b*y(i-1));
    y(i)=(2*x(i-1)*y(i-1)) + (c*x(i-1)) + (d*y(i-1));
end


figure(1)
subplot(2,1,1)
plot(x(1000:N),y(1000:N),'.','MarkerSize',8);
xlabel('x')
ylabel('y')

a=0.9;
b=-0.6013;
c=2;
d=0.5;

N=10000;

x=zeros(1,N);
y=zeros(1,N);
x(1)=0.1;
y(1)=0.1;
for i=2:N
    x(i)=(x(i-1)^2) - (y(i-1)^2) + (a*x(i-1)) + (b*y(i-1));
    y(i)=(2*x(i-1)*y(i-1)) + (c*x(i-1)) + (d*y(i-1));
end

subplot(2,1,2)
plot(x(1000:N),y(1000:N),'.','MarkerSize',8);
xlabel('x')
ylabel('y')