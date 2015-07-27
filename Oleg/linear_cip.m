% Linear transport equation
% CIP method
% 12/06/2015
% Oleg Kravchenko

% clear all
close all
clc

%% initial parameters
nx      = 100;                      % number of points
a       = 0;                        % left space border
b       = 1;                        % right space border
dx      = (b - a) / (nx - 1);       % space step
x       = a:dx:b;                   % space grid
c       = 1;                        % velocity of the wave
sigma   = 0.50;                      % Courant Friedrichs Lewy number
dt      = sigma*dx / c;             % time step
tfin = 3;                        % final time
%tcycle  = 300;
%tfin    = tcycle * dt;
tcycle = tfin/dt;

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
an      = 0*u0(L);
bn      = an;
cn      = an;
dn      = an;
sn      = 0*u0;

figure(2)
offset = 0.15;
for j = 1:tcycle
    %% compute
    sn(L) = (u(R) - u(L)) / dx;
    %     an(R) = (v(R) + v(L) - 2*sn(L)) / dx^2;
    %     bn(R) = (-3*sn(L) + 2*v(R) + v(L)) / dx;
    %     cn(R) = v(R);
    %     dn(R) = u(R);
    an = (v(R) + v(L) - 2*sn(L)) / dx^2;
    bn = (-3*sn(L) + 2*v(R) + v(L)) / dx;
    cn = v(R);
    dn = u(R);
    % next time step
    %     vn(R) = (-3*an(R)*dt + 2*bn(R))*(-dt) + cn(R);
    %     un(R) = ((-an(R)*dt + bn(R))*(-dt) + cn(R))*(-dt) + dn(R);

    vn(R) = (-3*an*dt + 2*bn)*(-dt) + cn;
    un(R) = ((-an*dt + bn)*(-dt) + cn)*(-dt) + dn;

    % monitonization for u
    for k = 2:nx
        if un(k) > max(u(k),u(k-1))
            un(k) = max(u(k),u(k-1));
        elseif un(k) < min(u(k),u(k-1))
            un(k) = min(u(k),u(k-1));
        end
    end
    
    % periodic (cyclic) BC
    un(1) = un(end);
    
    %% update
    t = t + dt;
    u = un;
    v = vn;
    
	%% time steps counter
    ind = ind + 1;
    %disp([ind t])
    
    %% draw
    if mod(ind,100)
    [utmp, vtmp, bc1, bc2] = ic(id, mod(x - c*t, 1), c);
    plot(x, u0,'k', x, un, '.-', x, utmp,'-')
    %ylim([min(u0)-offset max(u0)+offset])
    %text(0.5, 1.1, [int2str(ind) '/' int2str(tcycle)])
    drawnow
    end

end

er1 = norm(un - utmp, Inf);
er2 = (sum(abs(un - utmp).^2)/nx)^0.5;
er3 = norm(un - utmp, 1);

disp(['Inf norm: '  num2str(er1)])
disp(['L2 norm: '   num2str(er2)])
disp(['L1 norm: '   num2str(er3)])