% Nonlinear transport equation
% u_t + u u_x = 0
% Tanaka example:
% R. Tanaka, T. Nakamura, T. Yabe,
% Constructing exactly conservative scheme
% in  a non-conservative form
% Comp. Physics Comm., 126 (2000) 232-243
% CIP-CSL4 method
% 20/06/2015
% Oleg Kravchenko

clear all
close all
clc

%% initial parameters
nx      = 101;                      % number of points
a       = 0;                        % left space border
b       = 1;                        % right space border
dx      = 100*(b - a) / (nx - 1);       % space step
x       = linspace(a,b,nx);                   % space grid
c       = 1;                        % velocity of the wave
% cfl     = 0.9;
% dt      = cfl*dx;
% tcycle  = 100;
% tfin    = dt*tcycle;
tfin    = 100;
dt      = 10 / (nx - 1);             % time step
% sigma   = dt/dx;                      % Courant Friedrichs Lewy number
% tfin    = 5;                        % final time
tcycle  = tfin / dt;
L       = 1:nx-1;
R       = 2:nx;
ind     = 1;

%% initial condition
u0 = 0.5 + 0.4*cos(2*pi*x);
v0 =  0.8*pi*sin(2*pi*x);
% [u0, v0, ubc, vbc] = ua_nonlinear(9,0.5,x,0,0.5);

% plot the initial condition
figure(1)
plot(x, u0, x, v0)
% ylim([-0.5 1.5])

%% computation
un      = u0;
vn      = v0;
u       = u0;
v       = v0;
utmp    = u0;
vtmp    = v0;
t       = 0;
an      = 0*u0;
bn      = an;
cn      = an;
dn      = an;
rho     = 0.5*(u0(R) + u0(L))*dx;
rho_n   = 0*rho;
xi      = an;
delta_rho = an;

ndx     = -dx;

%% CIP-CSL4
cd dat
load 'tanaka_sample/upwind_1001.dat'
cd ..
xtmp = linspace(a,b,1001);
% upwind_1001 = ua_nonlinear(9, 0.5, xtmp, dt*tfin, 0.5);

figure(2)
offset = 0.15;
for j = 1:tcycle
    % advection phase
    an(R) = -2.5 * (6*(u(L)+u(R))*ndx - (v(L)-v(R))*ndx^2 + 12*rho) / ndx^5;
    bn(R) =    4 * ((7*u(L)+8*u(R))*ndx - (v(L)-1.5*v(R))*ndx^2 + 15*rho) / ndx^4;
    cn(R) = -1.5 * (4*(2*u(L)+3*u(R))*ndx - (v(L)-3*v(R))*ndx^2 + 20*rho) / ndx^3;
    % next time step
    xi = -u*dt;
    un = an.*xi.^4 + bn.*xi.^3 + cn.*xi.^2 + v.*xi + u;
    vn = 4*an.*xi.^3 + 3*bn.*xi.^2 + 2*cn.*xi + v;   
    % nonadvection phase    
    vn = vn - vn.^2*dt;    
    % BC
    un(1) = u(end);
    vn(1) = v(end);
%     un(1) = ubc;
%     vn(1) = vbc;
    % fluxes
    xi = -0.5*un*dt;
    delta_rho = -(an.*xi.^5/5 + bn.*xi.^4/4 + cn.*xi.^3/3 + vn.*xi/2 + un).*xi;
    rho_n = rho - delta_rho(R) + delta_rho(L);
    % update
    t   = t + dt;
    u   = un;
    v   = vn;
    rho = rho_n;
    
    % draw
    plot(x, u0,'k', x, un, '.-', xtmp, upwind_1001)
%     plot(x, u0,'k', x, un, '.-', x, utmp,'-')
    ylim([min(u0)-offset max(u0)+offset])
    text(0.5, 1.1, [int2str(ind) '/' int2str(tcycle)])
    drawnow

    
    %% time steps counter
    ind = ind + 1;
    disp([ind t])
end

% er1 = norm(un - utmp, Inf);
% er2 = (sum(abs(un - utmp).^2)/nx)^0.5;
% er3 = norm(un - utmp, 1);
% 
% disp(['Inf norm: '  num2str(er1)])
% disp(['L2 norm: '   num2str(er2)])
% disp(['L1 norm: '   num2str(er3)])