%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 Solving 1-D wave equation with 
%     constrained interpolation profile-Conservative Semi-lagrangian
%                     algorithm namely CIP-CSL
%
%               du/dt + df/dx = S(x),  for x \in [a,b]
%               where f = v(x,t)*f: linear/quasilinear
%
%              coded by Manuel Diaz, NTU, 2015.07.20
%                               
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Refs: 
% [1] Xiao, Feng, and Takashi Yabe. "Completely conservative and
%     oscillationless semi-Lagrangian schemes for advection transportation."
%     Journal of computational physics 170.2 (2001): 498-522.  
% [2] Li, Satoshi, and Feng Xiao. "CIP/multi-moment finite volume method
%     for Euler equations: a semi-Lagrangian characteristic formulation."
%     Journal of Computational Physics 222.2 (2007): 849-871.  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Notes: Basic Scheme Implementation without time integration method.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; %close all; clc;

%% Parameters
fluxfun = 'linear'; 
    cfl = 0.20;	% CFL condition.
   tEnd = 1;	% final time.
     nx = 201;	% number of nodes.
 scheme = 3;	% {3}CSL3.
    
% Build Mesh
a=-1; b=1; dx=(b-a)/(nx-1); x=a:dx:b; xc=a+dx/2:dx:b;

% Define Velocity Field functions
switch fluxfun
    case 'linear'
        advect = @(x) +1.0*ones(size(x));
    case 'quasilinear' 
        advect = @(x) 1.0+0.5*sin(2*pi*x);
end

% Build discrete velocity field
v=advect(x);

% Build IC
ICcase=2;  % {1}Testing, {2}Costum ICs
switch ICcase
    case 1 % Testing IC
        u0=TestingIC(x);  % Jiang and Shu IC
    case 2 % Guassian IC
        u0=CommonIC(x,9); % cases 1-9 <- check them out!
end

% Exact solution
ue=u0;

% Set plot range
dl=0.1; plotrange=[a,b,min(u0)-dl,max(u0)+dl];

%% Solver Loop

% set initial time step
dt0=cfl*dx/max(abs(v(:)));

% Set initial time & load IC
t=0; u=u0; vsgn=sign(v); g=zeros(1,nx-1); it=0; dt=dt0; 
% Set F (shift polynom)
F = ue;
% Data indexes
L = 1:nx-1;
R = 2:nx;
while t < tEnd
    % Correction for final time step
    if t+dt>tEnd, dt=tEnd-t; end
    
    % Iteration counter
    it=it+1; 
    
    % physical displacement
    xi=-v*dt;

    % Data arrays
    %um=u(1:nx-2); uo=u(2:nx-1); up=u(3:nx);
    uo=u(L); up=u(R); go=g(L); gm=[g(nx-1), g(1:nx-2)];
    
    % Build F_R(x) interpolation polynomial
    if vsgn > 0
        % Cell mass($\rho$) & central slope
        r=0.5*(uo+up)*dx-(go-gm); d=(up-uo)/dx; % 2nd order approx
        % Compute CIP-CSL coeficients for R-bias interp-poly
        c1=  6*r/dx^2 - 6*uo/dx - 2*d;
        c2= -6*r/dx^3 + 3*(3*uo-up)/dx^2 + 6*d/dx;
        c3= -4*(uo-up)/dx^3 - 4*d/dx^2;
        
        % Next time step
        F(R) = c3.*xi(R).^3 + c2.*xi(R).^2 + c1.*xi(R) + uo;        
    else
        % Cell mass($\rho$) & central slope
        r=0.5*(uo+up)*dx; d=(uo-up)/dx; % 2nd order approx
        % Compute CIP-CSL coeficients for L-bias interp-poly
        c1= -6*r/dx^2 - 6*uo/dx - 2*d;
        c2= -6*r/dx^3 + 3*(3*up-uo)/dx^2 - 6*d/dx;
        c3=  4*(up-uo)/dx^3 - 4*d/dx^2;
        
        % Next time step
        F(L) = c3.*xi(L).^3 + c2.*xi(L).^2 + c1.*xi(L) + uo;
    end
    
	
    % flux of mass across cell boundaries
    g = - min(0, xi(R)) .*(uo + c1.*xi(R)/2 + c2.*xi(R).^2/3 + c3.*xi(R).^3/4) - ...
        max(0, xi(L)) .* (uo + c1.*xi(L)/2 + c2.*xi(L).^2/3 + c3.*xi(L).^3/4); 
    
    % BCs and update
%     u_tilde = [F(nx-1),F];
    %u_tilde = [F(nx-2),F,F(1)];
    u_tilde = F;
    
    
    % non-Advection step
    u = u_tilde - 0.5*(dt/dx)*(v-v).*u_tilde;    
    % BC
    u(1) = u_tilde(end);

    % Increment time
    t=t+dt;
    
    % Plot u
    if rem(it,1)==0
        figure(2); plot(x,u,'ob-'); axis(plotrange); grid on; drawnow;
%         plot(x,CommonIC(x-t,9),'-k',x,u,'ob-'); 
    end
end 

% Post-Process
ue = CommonIC(mod(x - t, .5),9); % exact solution in final time step
figure(2); plot(x,ue,'-k',x,u,'ob-'); axis(plotrange); grid on; drawnow;