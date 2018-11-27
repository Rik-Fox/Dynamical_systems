function  f = AtriODE(t,init,flag,mu,b,v,beta,tau_h,k1,kgamma,kf,gamma);

f= zeros(2,1);
c = init(1);
h = init(2);

f(1) = mu*kf*h*(b+((v*c)/(k1+c))) - ((gamma*c)/(kgamma+c)) + beta;
f(2) = ((k1^2)/(tau_h*((k1^2)+c))) - (h/tau_h);

