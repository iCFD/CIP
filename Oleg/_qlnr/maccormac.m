%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                   Numerical solution of quasilinear transport equation 
%                           u_t + f(u)_x = 0, f(u) = 0.5*u.^2;
%                       by MacCormack scheme (MC) 
%                    coded by Oleg Kravchenko 2015.11.30
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Refs:
% [1] Link: https://en.wikipedia.org/wiki/MacCormack_method
% [2] Link: http://ow.ly/VfUzl
% [3] Link: http://how.gi.alaska.edu/ao/sim/chapters/chap10.pdf
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; close all; %clc;


%% Initial parameters
nx                      = 2^7;                     	% number of points
a                       = -2;                       % left space border
b                       = 4;                        % right space border
hx                      = (b - a) / (nx - 1);       % space step
x                       = linspace(a,b,nx);         % space grid
x32                     = linspace(a,b,32*nx);
c                       = 1;                        % velocity of the wave
sigma                   = 0.75;                      % Courant Friedrichs Lewy number
dt                      = sigma*hx / c;             % time step
t0                      = 0;
tfin                    = 50*dt;                   % final time
flag                    = 1;                        % simple monotonization
offset                  = 0.15;

% flux function
flux = @(u) 0.5*u.^2;

%% Initial condition
id = 1;                                 % id number of the initial function
u0 = ua_nln_samples(id,x,0,0,1);        % initial wave function
ua = ua_nln_samples(id,x32,tfin,0,1);   % final solution

% % plot the initial condition
% figure(1),
% plot(x,u0,x32,ua)
% ylim([min(u0)-offset max(u0)+offset])

%% Computation
f   = flux(u0);
f1  = zeros(1,nx-1);
f2  = f1;
u   = u0;
us  = u;
un  = u0;
u1  = zeros(1,nx-1);
u2  = zeros(1,nx-1);

L = 1:nx-1;
R = 2:nx;
C = 2:nx-1;

figure(4)
%% Main loop
for t = t0:dt:tfin
    %MacCormack(explicit, second order)
    %
    %ustar(i)=un(i)-(0.5*dt/dx)*(un(i+1).^2-un(i).^2);
    %u(i)=0.5*(un(i)+ustar(i)-(0.5*dt/dx)*(ustar(i).^2-ustar(i-1).^2));
    
    % predictor: 
    us(L)       = u(L) - sigma*(f(R) - f(L));
    fs          = flux(us);
    % corrector:    
    un(R)       = 0.5*(u(R) + us(R) - sigma*(fs(R) - fs(L)));
    % update:
%     f           = flux(u);
%     u2          = 0.5*(un(R)+un(L)) - 0.5*sigma*(f(R)-f(L));
%     f2          = flux(u2); 
%     un(3:nx-2)  = un(3:nx-2) - sigma*(f2(3:nx-2)-f2(2:nx-3));
    
        
    % monitonization for u
    if flag == 1        
        for k = 2:nx
            if un(k) > max(u(k),u(k-1))
                un(k) = max(u(k),u(k-1));
            elseif un(k) < min(u(k),u(k-1))
                un(k) = min(u(k),u(k-1));
            end
        end
    end % if flag = 1
    
    % new time step
    t = t + dt;
    
    % update
    u = un;
    f = flux(u);
    
    plot(x,u0,'k',x,un,'r.-',x32,ua)
    ylim([min(u0)-offset-.7 max(u0)+offset])
    xlabel('$x$','Interpreter','latex','Fontsize',12)
    ylabel('$u(x,t)$','Interpreter','latex','Fontsize',12)
    title('MacCormack scheme','Interpreter','latex','Fontsize',12);    
    text(0.76,-0.2,['time: ' num2str(t,'%-5.2f') ' / ' num2str(tfin,'%-5.2f')])
    drawnow 
end

hold on
text(0.76,-0.40,'info:');
text(1.2,-0.50,['tfin = ' num2str(tfin,'%-5.2f')]);
text(1.2,-0.60,['$\sigma$ = ' num2str(sigma,'%-5.2f')],'Interpreter','latex');
text(1.2,-0.70,['nx = ' int2str(nx)],'Interpreter','latex');

%% Errors
ua      = ua_nln_samples(id,x,tfin,0,1);   % final solution
err2    = (sum((ua - u).^2)/nx)^0.5;
fprintf ( 1, '  L_2 error: ' )
fprintf ( 1, num2str(err2))