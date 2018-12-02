clear all
close all

a=1.4;
b=-0.3;

N=10000;

figure(1)
subplot(1,2,1)
[x,y]=Henon_map(a,b,N);
plot(x(1000:N),y(1000:N),'*','MarkerSize',8); %this disregards the first 1000 iterates and
%graphs the rest in the Cartesian plane.
axis([-2.5 2.5,-2.5,2.5])
xlabel('x')
ylabel('y')


% Basin of attraction


N=1000;
Z=zeros(2,N);

x=-2.4:0.01:2.4;
y=-2.4:0.01:2.4;

M=length(x);

A=zeros(M,M);

for i=1:M
    for j=1:M
       Z(1,1)=x(i);
       Z(2,1)=y(j);
       for n=2:N
           Z(1,n)=a-Z(1,n-1).^2+b*Z(2,n-1); 
           Z(2,n)=Z(1,n-1); 
       end
       if isinf(Z(1,N))
           A(i,j)=1;
       else
           if isnan(Z(1,N))
              A(i,j)=1;
           else
               A(i,j)=2; %Z(1,N);
           end
       end
        
    end
end

subplot(1,2,2)
pcolor(x,y,A')
shading interp
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bifurcation diagram

b=0.4;


N=1000;

a_range=0:0.01:1.25;
M=length(a_range);

Z=zeros(M,N);

for k=1:M
    [x,y]=Henon_map(a_range(k),b,N);
    Z(k,:)=x;
end

figure(2)
plot(a_range(1),Z(1,100:end),'.k','MarkerSize',5)
hold on

for k=2:M
    plot(a_range(k),Z(k,100:end),'.k','MarkerSize',5)
end

axis([0 1.25 -2.5 2.5])


