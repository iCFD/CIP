%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                   Numerical solution of quasilinear transport equation 
%                           u_t + f(u)_x = 0, f(u) = 0.5*u.^2;
%                   by Belotserkovskii-Grudnitskii-Prokhorchuk scheme (BGP) 
%                    coded by Oleg Kravchenko 2013.12.19
%                       UPD1: 2015.11.04
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Refs:
% [1] O.M. Belotserkovskii, V.G. Grudnitskii, and Yu.A. Prokhorchuk. 
%       "Difference scheme of second-order of accuracy on the minimal pattern
%       for hyperbolic equations." U.S.S.R. Comp. Math. Phys. 23 (1983): 81-86
% [2] Link: http://www.sciencedirect.com/science/article/pii/S0041555383800147
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Keywords: Belotserkovskii-Grudnitskii-Prokhorchuk scheme
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; close all; clc;

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
flux = @(u)     0.5*u.^2;
plux = @(u,v)   u.*v;
tlux = @(u,v) - u.^2.*v;

%% Initial condition
id = 1;                                 % id number of the initial function
u0 = ua_nln_samples(id,x,0,0,1);        % initial wave function
ua = ua_nln_samples(id,x32,tfin,0,1);   % final solution
v0 = [(u0(2)-u0(1))/hx 0.5*(u0(3:nx)-u0(1:nx-2))/hx (u0(nx)-u0(nx-1))/hx];
figure(1)
plot(x,u0,x,v0)
ylim([-0.5 1.5])

%% Computation
un      = u0;
u       = u0;
vn      = v0;
v       = v0;
% Indexes
cL = 1:nx-2;
cC = 2:nx-1;
cR = 3:nx;


figure(4)
%% Main loop
for t = t0:dt:tfin
    % Step 1:
    % computation of differential consequence of u
    G = plux(un, vn);
    vn(cC) = 0.5*(un(cR)-un(cL))/hx - sigma*0.5*(G(cR)-G(cL)); 
    % Step 2:
    % computation of  u    
    F   = flux(un);
    Ft  = tlux(un, vn);
    un(cC) = 0.5*(u(cR)+u(cL)) - ...
        0.50*sigma*(F(cR)-F(cL)) - ... 
        0.25*hx*(vn(cR)-vn(cL)) - ...
        0.25*dt*sigma*(Ft(cR)-Ft(cL));     
    % BC
    un(1) = u0(1);
    vn(1) = v0(1);

   
    u = un;
    v = vn;
    
%     hold off
    plot(x,u0,'k',x,un,'r.-',x32,ua)
    ylim([min(un)-offset-.7 max(un)+offset])
    xlabel('$x$','Interpreter','latex','Fontsize',12)
    ylabel('$u(x,t)$','Interpreter','latex','Fontsize',12)
    title('BGP scheme','Interpreter','latex','Fontsize',12);    
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