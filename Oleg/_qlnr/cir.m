%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                   Numerical solution of quasilinear transport equation 
%                           u_t + f(u)_x = 0, f(u) = 0.5*u.^2;
%                       by Courant-Isaacson-Rees scheme (CIR) 
%                    coded by Oleg Kravchenko 2013.10.23
%                       UPD1: 2015.11.04
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Refs:
% [1] Courant, R., Isaacson, E. and Rees, M. "On the solution
%       of nonlinear hyperbolic differential equations by finite differences." 
%       Comm. on Pure and Appl. Math. 5 (1952): 243-255
% [2] Link: http://onlinelibrary.wiley.com/doi/10.1002/cpa.3160050303/abstract
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear; close all; clc;

%% Initial parameters
nx                      = 2^7;                  % number of points
a                       = -2;                   % left space border
b                       = 4;                    % right space border
hx                      = (b-a) / (nx-1);
x                       = linspace(a,b,nx);    % space grid
x32                     = linspace(a,b,32*nx);
c                       = 1;                    % velocity of the wave
sigma                   = 0.75;                  % Courant Friedrichs Lewy number
dt                      = sigma*hx / c;         % time step
t0                      = 0;                  % final time
tfin                    = 50*dt;                  % final time
offset                  = 0.15;


%% Initial condition
id = 1;                                 % id number of the initial function
u0 = ua_nln_samples(id,x,0,0,1);        % initial wave function
ua = ua_nln_samples(id,x32,tfin,0,1);   % final solution

% % plot the initial condition
% figure(1),
% plot(x, u0, x32, ua)
% ylim([min(u0)-offset max(u0)+offset])

%% Computation
un  = u0;
u   = u0;
figure(4)
% t = tau;

% Main loop
for t = t0:dt:tfin;
    for m=2:nx-1
        if u(m) < 0
            un(m) = u(m) - 0.5 * sigma * (u(m+1)*u(m+1) - u(m)*u(m));
        elseif u(m) >= 0
            un(m) = u(m) - 0.5 * sigma * (u(m)*u(m) - u(m-1)*u(m-1));
        end
    end % for
    
    % new time step
    u = un;
    
    plot(x,u0,'k',x,un,'r.-',x32,ua)
    ylim([min(u0)-offset-.7 max(u0)+offset])
    xlabel('$x$','Interpreter','latex','Fontsize',12)
    ylabel('$u(x,t)$','Interpreter','latex','Fontsize',12)
    title('CIR scheme','Interpreter','latex','Fontsize',12)
    drawnow
%     pause(0.01)

    text(0.76,-0.2,['time: ' num2str(t,'%-5.2f') ' / ' num2str(tfin,'%-5.2f')])
    drawnow
    disp(t)
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