% mcv3 main file

clear all
close all
clc

% parameters
nx      = 100;
ns      = 3;
dx      = 1/nx;
cfl     = 0.2;
dt      = cfl*dx;
nmax    = 1/dt;
id      = 1;            % MCV3-1, MCV_UPPC-2, MCV_CPCC-3

u       = zeros(nx+2, ns);
v       = u;
x       = u; 
f_x     = u;
fm_x    = u;
f1      = u;
f2      = u;
f3      = u;
u0      = u;
uout    = zeros(1, nx);
xout    = uout;

tmp = 1:ns;
xi = 2 * (tmp-1) / (ns-1) - 1;    % local grid (3 point in MCV3)
disp(xi)

ind = 1:nx+1;
for k = 1:ns
    x(1:nx+1, k) = (ind + 0.5*xi(k)) * dx; % global space grid
end % for
disp(x)

% initial condition
u(x(:,1)>=0.4&x(:,1)<=0.6, :) = 1;

offset = .1;
figure,
plot(x(:,1), u(:,1))
ylim([min(u(:,1))-offset max(u(:,1))+offset])
xlim([min(x(:,1))-offset max(x(:,1))+offset])

u = bcd(u, nx, ns);
v = bcd(v, nx, ns);

ind2 = 2:nx+1;
for nn = 1:1000;
    % initialization
    u0      = u;        
    % step 1    
    fm_x    = mflux_x(u, v, fm_x, xi, dx, nx, ns, id);    
    f1      = fm_x;
    
    for k = 1:ns
        u(ind2, k) = u0(ind2, k) - dt*fm_x(ind2, k);
    end % for k
   
    u = bcd(u, nx, ns);
    
    % step 2
    fm_x    = mflux_x(u, v, fm_x, xi, dx, nx, ns, id);
    f2      = fm_x;
    
    for k = 1:ns
        u(ind2, k) = u0(ind2, k) - 0.25*dt*(f1(ind2, k) + f2(ind2, k));
    end % for k
    
    u = bcd(u, nx, ns);

    % step 3
    fm_x    = mflux_x(u, v, fm_x, xi, dx, nx, ns, id);    
    f3      = fm_x;
    
    for k = 1:ns
        u(ind2, k) = u0(ind2, k) - 0.1667*dt*(f1(ind2, k) + f2(ind2, k) + 4*f3(ind2, k));
    end % for k
    
    u = bcd(u, nx, ns);
    
    % output
    xout(ind2) =  (ind2 - 0.5)*dx;
    uout(ind2) = (u(ind2, 1) + 4*u(ind2, 2) + u(ind2, 3)) / 3;        
end % for nn

figure,
plot(xout, uout)