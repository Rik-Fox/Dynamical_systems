clear variables
set(0,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',14)
options = odeset('RelTol',1e-08,'AbsTol',1e-08);

b = 0.11;
v = 0.889;
beta = 0.02;
tau_h = 2;
k1 = 0.7;
kgamma = 0.1;
kf = 8.1;
gamma = 2;

mu = linspace(0,1.5,16) ;
c = 0 ;
h = 0;

t = linspace(0,100,1024);

phase0 = [c,h];

% for j=1:16
%     
%     [t,phase] = ode45('AtriODE',t,phase0,options,mu(j),b,v,beta,tau_h,k1,kgamma,kf,gamma);
%     
%     figure(j)
%     hold on
%     plot(phase(:,1),phase(:,2))
%     axis([0,3 0,1])
% end

Nmu = 1024;
mu_vec = linspace(0,1.5,Nmu);

Ntrans = linspace(0,100,256);
Nt = 256;
NT = linspace(0,100,Nt);
xstart = sqrt(2)/10;

phaseplot = zeros(Nmu,2);


for k = 1:Nmu   
     
    
    [Ntrans,phase] = ode45('AtriODE',t,phase0,options,mu_vec(k),b,v,beta,tau_h,k1,kgamma,kf,gamma);   
    
    phase0 = phase(1024,:);    
    
    [NT,phase] = ode45('AtriODE',t,phase0,options,mu_vec(k),b,v,beta,tau_h,k1,kgamma,kf,gamma);
    
    phaseplot(k,:) =  phase(Nt,:);

end
 
figure(1)

plot(phaseplot,'k.','MarkerSize',1)
xlabel('Control parameter \mu')
ylabel('lim_{n\rightarrow\infty} x_n')
title ('Bifurcation Diagram')




%     Nc = 64;
%     Nh = 64;
%     
%     c_vec = linspace(0,3,Nc);
%     h_vec = linspace(0,1,Nh);
%     
%     x_c = zeros(Nc,Nh,2);
%     x_h = zeros(Nc,Nh,2);
%     
%     for i=1:Nc
%         for j=1:Nh
%             
%             init_c = c_vec(i);
%             
%             init_h = h_vec(j);
%             
%             x0 = [init_c,init_h];
%             
%             fun1 = @(x) mu(j)*kf*x(2)*(b+((v*x(1))/(k1+x(1)))) - ((gamma*x(1))/(kgamma+x(1))) + beta;
%             
%             x_c(i,j,:) = fsolve(fun1,x0);
%             
%             fun2 = @(x) ((k1^2)/((k1^2)+x(1))) - x(2);
%             
%             x_h(i,j,:) = fsolve(fun2,x0);
%         end
%     end
%     
%     figure(j)
%     plot(c_vec,x_c(:,2),'r')
%     plot(h_vec,x_h(:,2),'g')

