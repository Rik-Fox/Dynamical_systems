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

for j=1:16
    
    [t,phase] = ode45('AtriODE',t,phase0,options,mu(j),b,v,beta,tau_h,k1,kgamma,kf,gamma);
    
    figure(j)
    hold on
    plot(phase(:,1),phase(:,2))
    
    Nc = 64;
    Nh = 64;
    
    c_vec = linspace(0,3,Nc);
    h_vec = linspace(0,1,Nh);
    
    x_c = zeros(Nc,2);
    
    for i=1:Nc
        
        init_c = c_vec(i);
        
        init_h = 0;
        
        x0 = [init_c,init_h];
        
        fun = @(x) mu(j)*kf*x(2)*(b+((v*x(1))/(k1+x(1)))) - ((gamma*x(1))/(kgamma+x(1))) + beta;
        
        x_c(i,:) = fsolve(fun,x0);
    end
    
    figure(j)
    plot(c_vec,x_c(:,2),'r')
    
    x_h = zeros(Nh,2);
    
    for i=1:Nh
        
        init_c = c_vec(i);
        
        init_h = 0;
        
        x0 = [init_c,init_h];
        
        fun = @(x) ((k1^2)/(k1^2)+x(1)) - x(2);
        
        x_h(i,:) = fsolve(fun,x0);
    end
    
    figure(j)
    plot(c_vec,x_h(:,2),'g')
end

