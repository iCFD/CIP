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
% [1] Yabe, T., et al. "An exactly conservative semi-Lagrangian scheme
%     (CIP-CSL) in one dimension." Monthly Weather Review 129.2(2001):332-344. 
% [2] Li, Satoshi, and Feng Xiao. "CIP/multi-moment finite volume method
%     for Euler equations: a semi-Lagrangian characteristic formulation."
%     Journal of Computational Physics 222.2 (2007): 849-871.  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Notes: Basic Scheme Implementation without time integration method.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; close all; clc;

%% Parameters
fluxfun = 'linear'; 
    cfl = 0.95;	% CFL condition.
   tEnd = 0.60;	% final time.
     nx = 101;	% number of nodes.
 scheme = 2;	% {2}CSL4.
    
% Build Mesh
a=-1; b=1; x=linspace(a,b,nx)'; dx=x(2:nx)-x(1:nx-1); xc=x(1:nx-1)+dx/2;

% Define Velocity Field functions
switch fluxfun
    case 'linear'
        advect = @(x) +1.0*ones(size(x));
    case 'quasilinear' 
        advect = @(x) 1.0+0.5*sin(2*pi*x);
end

% Build discrete velocity field
vc=advect(xc); v=advect(x); vsgn=zeros(nx,1); vsgn(2:nx-1)=sign(v(2:nx-1));

% Build IC
ICcase=2;  % {1}Testing, {2}Costum ICs
switch ICcase
    case 1 % Testing IC
        u0=TestingIC(x);  % Jiang and Shu IC
    case 2 % Guassian IC
        u0=CommonIC(x,2); % cases 1-9 <- check them out!
end

% Gradient of IC
du0=Gradient(u0,dx);
%du0=minGradient(u0,dx);

% Exact solution
ue=u0;

% Cell's mass
r0=0.5*(u0(1:nx-1)+u0(2:nx)).*dx;

% indices
i = (2:nx-1)';
iup = i-vsgn(2:nx-1);
ic = iup;
icel = find(vsgn < 0);
ic(icel-1) = icel;
dxi=dx; dxi(i)=x(iup)-x(i);

% Set plot range
dl=0.1; plotrange=[a,b,min(u0)-dl,max(u0)+dl];

%% Solver Loop

% set initial time step
dt0=cfl*min(abs(dx(:)./vc(:)));

% build arrays
a=zeros(nx,1);                       
b=zeros(nx,1);
c=zeros(nx,1);

% Set initial time & load IC
t=0; u=u0; du=du0; r=r0; it=0; dt=dt0; 

while t < tEnd
    % Correction for final time step
    if t+dt>tEnd, dt=tEnd-t; end
    
    % Iteration counter
    it=it+1;
    
    % Spatial displacement
    %xi=-v*dt;
    e = -v.*dt;
    e2 = e.*e;
    e3 = e.*e2;
    e4 = e.*e3;
    e5 = e.*e4;
           
    % Compute CIP coeficients
    a(i) = ((-2.5)./(dxi(i).^5)).*(6.0*(u(iup)+u(i)).*dxi(i) - (du(iup)-du(i)).*(dxi(i).^2) + 12.0*vsgn(i).*r(ic));
    b(i) = (4.0./dxi(i).^4).*( (7.0*u(iup)+ 8.0*u(i)).*dxi(i)- (du(iup)-1.5*du(i)).*(dxi(i).^2) + 15.0*vsgn(i).*r(ic));
    c(i) = (-1.5./(dxi(i).^3)).*( 4.0*(2.0*u(iup)+3.0*u(i)).*dxi(i)- (du(iup)-3.0*du(i)).*(dxi(i).^2) + 20.0*vsgn(i).*r(ic));

	% flux crossing the cells faces
    dr(i)  = (-1)*(e5(i).*a(i)/5 + e4(i).*b(i)/4 + e3(i).*c(i)/3  + e2(i).*du(i)/2  + e(i).*u(i));
    
    % mass of the next time step
    r(2:(nx-2)) = r(2:(nx-2)) + dr(2:(nx-2))' - dr(3:(nx-1))';
    
    % interpolated function at xi
    u(i) = a(i).*e4(i) + b(i).*e3(i) + c(i).*e2(i) + du(i).*e(i) + u(i);
    
    % derivative with a "shift" 
    du(i) = 4*a(i).*e3(i) + 3*b(i).*e2(i) + 2*c(i).*e(i) + du(i);
    
    % Periodic BCs
    u(2)=u(nx-1); du(2)=du(nx-1); r(2)=r(nx-2);
    
    % Update
    %u=un; r=rn;

    % Increment time
    t=t+dt;
    
    % Plot u
    if rem(it,5)==0
        figure(2); plot(x,u,'ob'); axis(plotrange); grid on; drawnow;
    end
end 

% Post-Process
figure(2); plot(x,ue,'-k',x,u,'ob'); axis(plotrange); grid on; drawnow;

% How good is the approximation?
er1 = norm(u-ue,Inf);               disp(['Inf norm: ',num2str(er1)])
er2 = (sum(abs(u-ue).^2)/nx)^0.5;   disp(['L2 norm:  ',num2str(er2)])
er3 = norm(u-ue, 1 );               disp(['L1 norm:  ',num2str(er3)])