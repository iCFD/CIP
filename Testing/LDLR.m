%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%             Local Double Logarithm Reconstructions (LDLR) 
%                    coded by Manuel Diaz 2015.08.01
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Refs:
% [1] Artebrant, Robert, and H. Joachim Schroll. "Limiter-free third order
%     logarithmic reconstruction." SIAM Journal on Scientific Computing
%     28.1 (2006): 359-381. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; close all; clc;

%% Parameters
      v =-2.00;	% Advection Speed
    CFL = 0.60;	% CFL condition
   tEnd = 2.00;	% final time
     nx = 100;	% number of cells
     
% Build mesh
a=-1; b=1; dx=(b-a)/nx; x=a+dx/2:dx:b; tol=0.1*dx^q;

% Build IC
ICtest = 1;
switch ICtest
    case 1
        u0 = CommonIC(x,3); % Choose between 1~9 cases
    case 2
        u0 = TestingIC(x);
    otherwise
        error('IC not listed!');
end

% Set plot range
plotrange=[a,b,min(u0)-0.1,max(u0)+0.1];

%% Solver Loop 

% Time discretization
dt0=CFL*dx/abs(v);

% load initial conditions
u=u0; dt=dt0; it=0; t=0;

while t < tEnd
    uo = u;
    
    % Correction for final time step
    if t+dt>tEnd, dt=tEnd-t; end
    
    % update Iteration counter and time
    it=it+1; t=t+dt;
    
    % 1st stage
    dF = LDLRrhs(u,v,dx,nx,tol);
    u = uo-dt*dF;
    
    % 2nd Stage
    dF = LDLRrhs(u,v,dx,nx,tol);
    u = 0.75*uo+0.25*(u-dt*dF);

    % 3rd stage
    dF = LDLRrhs(u,v,dx,nx,tol);
    u = (uo+2*(u-dt*dF))/3;
    
    % Plot solution   
    if rem(it,50) == 0
       figure(2); plot(x,u0,'-k',x,u,'.r'); axis(plotrange);
       set(gca,'dataaspectratio',[1.2 2 1]); grid on; drawnow;
    end
end

%% PostProcess
figure(2); plot(x,u0,'-k',x,u,'.r'); axis(plotrange); grid on; 
legend('LDLR','Exact','Location','NorthEast'); legend('boxoff'); 
set(gca,'dataaspectratio',[1.2 2 1]);