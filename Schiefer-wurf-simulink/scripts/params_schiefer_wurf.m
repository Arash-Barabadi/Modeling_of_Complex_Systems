m = 0.5 ; % kg
v0 = 25 ; %m/s
phi0 = pi/4 ; 

A = 0.049; 
cw = 0.35; 
rho = 1.25; % Dichte kg/m³
g = 9.81; 

k = 0.5 * rho* cw * A ;  % Luftwiderstandskonstante
km = k/m ;
x0 = 0;
y0 = 0;
vx0 = v0 * cos (phi0) ; 
vy0 = v0 * sin (phi0) ;

t_end = 10; 
