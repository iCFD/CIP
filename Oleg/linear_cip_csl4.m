% Linear transport equation
% CIP4-CSL method
% 12/06/2015
% Oleg Kravchenko

clear all
close all
clc

%% initial parameters
nx      = 2^8;                      % number of points
a       = 0;                        % left space border
b       = 1;                        % right space border
dx      = (b - a) / (nx - 1);       % space step
x       = a:dx:b;                   % space grid
c       = 1;                        % velocity of the wave
sigma   = 0.95;                      % Courant Friedrichs Lewy number
dt      = sigma*dx / c;             % time step
% tfin = 30;                        % final time
tcycle  = 300;
tfin    = tcycle * dt;


%% initial condition
id = 4;                 % number of the initial function
[u0, v0] = ic(id, x, c);          % initial wave function
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
ind     = 1;
L       = 1:nx-1;
R       = 2:nx;
an      = 0*u0;
bn      = 0*u0;
cn      = 0*u0;
% dn      = 0*u0;
% sn      = 0*u0;
rho     = 0.5*(u0(L) + u0(R))*dx;
rho_n   = rho;
drho    = 0*rho;

mdx     = - dx;

figure(2)
offset = 0.15;
for j = 1:tcycle
    %% compute
    an(R) = -2.5*(6*(u(L) + u(R))*mdx - (v(L) - v(R))*mdx^2 + 12*rho(L)) / mdx^5;
    bn(R) = +4.0*((7*u(L) + 8*u(R))*mdx - (v(L) - 1.5*v(R))*mdx^2 + 15*rho(L)) / mdx^4;
    cn(R) = -1.5*(4*(2*u(L) + 3*u(R))*mdx - (v(L) - 3*v(R))*mdx^2 + 20*rho(L)) / mdx^3;

    % next time step
    vn(R) = -4*an(R)*dt^3 + 3*bn(R)*dt^2 - 2*cn(R)*dt + v(R);
    un(R) = an(R)*dt^4 - bn(R)*dt^3 + cn(R)*dt^2 - v(R)*dt + u(R);
    % fluxes
	drho = (an*dt^4/5 - bn*dt^3/4 + cn*dt^2/3 - v*dt/2 + u)*dt;
    rho_n(L) = rho(L) + drho(L) - drho(R);
    % periodic (cyclic) BC
%     un(1)       = u(1) - sigma * (u(1) - u(nx-1));
    un(1) = un(end);
%     un(1) = u(1);
%     vn(1) = v(1);
    
    %% update
    t = t + dt;
    rho = rho_n;  
    u = un;
    v = vn;
    %% draw
    [utmp, vtmp, bc1, bc2] = ic(id, mod(x - c*t, 1), c);
%     utmp(1) = utmp(nx);
    plot(x, u0,'k', x, un, '.-', x, utmp,'-')
%     plot(x, u0,'k:', x, utmp,':')
%     plot(x,u0,'k:',x,un,x + c*tfin,ic(id,x - c*tfin, c),'k:')
    ylim([min(u0)-offset max(u0)+offset])
    text(0.5, 1.1, [int2str(ind) '/' int2str(tcycle)])
    drawnow

    
%% time steps counter
%     t_count = t_count + 1;
    ind = ind + 1;
    disp([ind t])
end

er1 = norm(un - utmp, Inf);
er2 = (sum(abs(un - utmp).^2)/nx)^0.5;
er3 = norm(un - utmp, 1);

disp(['Inf norm: '  num2str(er1)])
disp(['L2 norm: '   num2str(er2)])
disp(['L1 norm: '   num2str(er3)])