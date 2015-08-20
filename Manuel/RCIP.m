%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 Solving 1-D wave equation with 
%       Rational constrained interpolation profile (RCIP) schemes
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
fluxfun = 'linear'; 
    cfl = 0.90;	% CFL condition.
   tEnd = 10.0;	% final time.
     nx = 201;	% number of nodes.
 scheme = 0;	% {0}CIP0 and {1}CPI1.
    
% Build Mesh
a=-1; b=1; dx=(b-a)/(nx-1); x=a:dx:b; 

% Define Velocity Field functions
switch fluxfun
    case 'linear'
        advect = @(x) +1*ones(size(x));
    case 'sine'
        advect = @(x) 1.5+cos(pi*x);
end

% Build discrete velocity field
v=advect(x);

% Build IC
ICcase=1;  % {1}Testing, {2}Costum ICs
switch ICcase
    case 1 % Testing IC
        u0=TestingIC(x);  % Jiang and Shu IC
    case 2 % Guassian IC
        u0=CommonIC(x,9); % cases 1-9 <- check them out!
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

isign = ((v>=0) + (-1)*(v<0));
i = 2:nx-1;

dx = zeros(1,nx);
dx(i) = x(i-isign(i)) - x(i);
dx(1) = abs(dx(2))*(-1)*isign(1);
dx(nx) = abs(dx(nx-1))*(-1)*isign(nx);

%du = minGradient(u,dx);
du = -gradient(u,abs(dx(1)));

while t < tEnd 
    % Correction for final time step
    if t+dt>tEnd, dt=tEnd-t; end
        
    np = length(u);
    isign = ((v>=0) + (-1)*(v<=0));
    i = 2:np-1;

    S = zeros(1,np);
    S(i) = (u(i-isign(i))-u(i))./dx(i);
    S(1) = ( (isign(1)==1).*u(np) + (isign(1)==-1).*u(2) - u(1))./dx(1);
    S(np) = ( (isign(np)==1).*u(np-1) + (isign(np)==-1).*u(1) - u(1))./dx(np);

    beta = zeros(1,np);

    for j=2:np-1
        if(du(j-isign(j))*du(j)<0)
            beta(j) = (abs((S(j)-du(j))./(du(j-isign(j))-S(j))) - 1)./dx(j);
        end
    end

    alpha = ones(1,np);

    % Interpolation coefs
    C0 = u;
    C1 = du + u.*alpha.*beta;
    C3 = zeros(1,np);
    C3(i) = (du(i)-S(i) + (du(i-isign(i))-S(i)).*(1 + alpha(i).*beta(i).*dx(i)) )./dx(i).^2;
    C3(1) = (du(1)-S(1) + ((isign(1)==1).*du(np) + (isign(1)==-1).*du(2) -S(1)).*...
        (1 + alpha(1).*beta(1).*dx(1)) )./dx(1).^2;
    C3(np) = (du(np)-S(np) + ((isign(np)==1).*du(np-1) + (isign(np)==-1).*du(1)-S(np)).*...
        (1 + alpha(np).*beta(np).*dx(np)) )./dx(np).^2;
    C2 = S.*alpha.*beta + (S-du)./dx - C3.*dx;

    % Displacement
    e = (-1)*v*dt;

    % sub-functions
    F0 = (1 + alpha.*beta.*e);
    F1 = (C3.*e.^3 + C2.*e.^2 + C1.*e + C0);
    F2 = (3*C3.*e.^2 + 2*C2.*e + C1);

    % Interpolation functions
    u = F1./F0; du = F2./F0-alpha.*beta.*F1./F0.^2;
    
    % Periodic Boundary Conditions
    if v(1)>0; u(1)=u(nx); du(1)=du(nx); else u(nx)=u(1); du(nx)=du(1); end
    
    % Increment time and counter
    t=t+dt; it=it+1;
    
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