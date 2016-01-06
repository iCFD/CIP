%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                   Numerical solution of quasilinear transport equation 
%                           u_t + f(u)_x = 0, f(u) = 0.5*u.^2;
%                       by Rusanov-Burstein-Mirin scheme (RBM) 
%                    coded by Oleg Kravchenko 2015.11.04
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Refs:
% [1] Rusanov V.V. "On Difference Schemes of Third Order Accuracy
%       for Nonlinear Hyperbolic Systems." Journal on Comp. Physics 5 (1970):
%       507-571
% [2] Samuel Z. Burstein, Arthur A. Mirin. "Third Order Difference Methods 
%       for Hyperbolic Equations." Journal on Comp. Physics 5 (1970):
%       547-571
% [3] Link: http://ow.ly/UfWuf
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; close all; % clc;


%% Initial parameters
nx                      = 2^7;                        	% number of points
a                       = -2;                             % left space border
b                       = 4;                                  % right space border
hx                      = (b - a) / (nx - 1);                % space step
x                       = a:hx:b;                             % space grid
x32                     = linspace(a,b,32*nx);                             % space grid
c                       = 1;                                  % velocity of the wave
sigma                   = 0.75;                            % Courant Friedrichs Lewy number
t0                      = 0;
dt                      = sigma*hx / c;                     % time step
tfin                    = 50*dt;                             % final time
omega                   = 0.5*(4*sigma^2-sigma^4 + 3);    % omega parameter
% omega                   = 2.99;
flag                    = 1;                               % simple monmotonization
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
un  = u0;
u1  = zeros(1,nx-1);
u2  = zeros(1,nx-1);

L = 1:nx-1;
R = 2:nx;

figure(4)
t = dt;
%% Main loop
for t = t0:dt:tfin
    
    u1          = 0.5*(u(R)+u(L)) - sigma*(f(R)-f(L))/3;
    f1          = flux(u1);
    u2(2:nx-1)  = u(2:nx-1) - 2*sigma*(f1(2:nx-1)-f1(1:nx-2))/3;
    f2          = flux(u2);
    un(3:nx-2)  = u(3:nx-2) - sigma*(-2*f(5:nx)+7*f(4:nx-1)-7*f(2:nx-3)+2*f(1:nx-4))/24 - ...
                    0.375*sigma*(f2(4:nx-1)-f2(2:nx-3)) - ...
                        omega*(u(5:nx)-4*u(4:nx-1)+6*u(3:nx-2)-4*u(2:nx-3)+u(1:nx-4))/24;
        
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
    
    % update
    u = un;
    f = flux(u);
    
    plot(x,u0,'k',x,un,'r.-',x32,ua)
    ylim([min(u0)-offset-1 max(u0)+offset])
    xlabel('$x$','Interpreter','latex','Fontsize',12)
    ylabel('$u(x,t)$','Interpreter','latex','Fontsize',12)
    title('Rusanov scheme','Interpreter','latex','Fontsize',12);    
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