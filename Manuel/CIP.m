%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 Solving 1-D wave equation with 
%           constrained interpolation profile (CIP) schemes
%
%               du/dt + df/dx = S(x),  for x \in [a,b]
%               where f = v(x,t)*f: linear/quasilinear
%
%              coded by Manuel Diaz, NTU, 2015.07.20
%                               
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Refs: 
% [1] Yabe, Takashi, and T. Aoki. "A universal solver for hyperbolic
%     equations by cubic-polynomial interpolation I. One-dimensional 
%     solver." Computer Physics Communications 66.2 (1991): 219-232.  
% [2] Xiao, Feng, and Takashi Yabe. "Completely conservative and
%     oscillationless semi-Lagrangian schemes for advection transportation."
%     Journal of computational physics 170.2 (2001): 498-522.  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Notes: Basic Scheme Implementation without time integration method.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; %close all; clc;

%% Parameters
fluxfun = 'scalar'; 
    cfl = 0.95;	% CFL condition.
   tEnd = 15;	% final time.
     nx = 101;	% number of nodes.
 scheme = 0;	% {0}CIP0 and {1}CPI1.
    
% Build Mesh
a=-1; b=1; dx=(b-a)/(nx-1); x=a:dx:b; 

% Define Velocity Field functions
switch fluxfun
    case 'scalar'
        advect = @(x) -2;
    case 'linear'
        advect = @(x) x;
end

% Build discrete velocity field
v=advect(x);

% Build IC
ICcase=2;  % {1}Testing, {2}Costum ICs
switch ICcase
    case 1 % Testing IC
        u0=TestingIC(x);  % Jiang and Shu IC
    case 2 % Guassian IC
        u0=CommonIC(x,2); % cases 1-9 <- check them out!
    otherwise
        error('IC file not listed');
end
% Gradient 
du0=gradient(u0,dx);

% Exact solution
ue=u0;

% Set plot range
d=0.1; plotrange=[a,b,min(u0)-d,max(u0)+d];

%% Solver Loop

% set initial time step
dt0=cfl*dx/max(abs(v(:)));

% Set initial time & load IC
t=0; u=u0; du=du0; vsgn=sign(v); it=0; dt=dt0; 

while t < tEnd
    % Correction for final time step
    if t+dt>tEnd, dt=tEnd-t; end
    
    % Iteration counter
    it=it+1; 
    
    % physical displacement
    xi=vsgn.*v*dt;
    
    % Displace info wrt to v
    up=circshift(u,[0,vsgn]); dup=circshift(du,[0,vsgn]);
       
    % Compute CIP coeficients
    c1= (du+dup)/dx^2 + 2*(u-up)/dx^3;
    c2= 3*(up-u)/dx^2 - (2*du+dup)/dx;
    
    % Build F(x) and F'(x) polynomials
    un= ((c1.*xi+c2).*xi+du).*xi + u;
    dun= (3*c1.*xi+2*c2).*xi + du;
    
    % Monitonization for u by Oleg
    if scheme==1
        for k = 1:nx
            if un(k) > max(up(k),u(k))
                un(k) = max(up(k),u(k));
            elseif un(k) < min(up(k),u(k))
                un(k) = min(up(k),u(k));
            end
        end
    end
    
    % Update 
    u=un; du=dun;
    
    % Periodic Boundary Conditions
    %u(1)=u(nx); du(1)=du(nx);
    u(nx)=u(1); du(nx)=du(1);
    
    % Increment time
    t=t+dt;
    
    % Plot u
    if rem(it,10)==0
        figure(2); plot(x,u,'ob'); axis(plotrange); grid on; drawnow;
    end
end 

% Post-Process
figure(2); plot(x,ue,'-k',x,u,'ob'); axis(plotrange); grid on; drawnow;

% How good is the approximation?
er1 = norm(u-ue,Inf);               disp(['Inf norm: ',num2str(er1)])
er2 = (sum(abs(u-ue).^2)/nx)^0.5;   disp(['L2 norm:  ',num2str(er2)])
er3 = norm(u-ue, 1 );               disp(['L1 norm:  ',num2str(er3)])