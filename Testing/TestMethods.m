function [L1_norm,Linf_norm] = TestMethods(u,CFL,tEnd,Ic,nx,method)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%       Solving 1-D wave equation with Finite Difference Methods
%
%                 dq/dt + df/dx = 0,  for x \in [a,b]
%                   where f = u*q :: linear flux
%
%              coded by Manuel Diaz, NTU, 2015.08.21
%                               
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear; close all; clc;

%% Parameters
%      u = 1.0;	% scalar velocity in x direction
%    CFL = 0.9;	% CFL condition
%   tEnd = 2.0;	% Final time
% 	nx = 20;	% number of cells/points
%     Ic = 3;     % Initial condition (see CommonIC.m)
% method = 3;     % {1}CIP0,  {2}CIP1,  {3}RCIP,  {4}CIP-CLS
%                 % {5}LDLR,  {6}WENO3, {7}WENO5, {8}WENO7.

%% Preprocess

% Build mesh
switch method
    case {1,2,3,4} % Finite Difference Formulation
        a=-1; b=1; dx=(b-a)/(nx-1); x=a:dx:b;   % x: points
    case {5,6,7,8} % Finite Volume Formulation
        a=-1; b=1; dx=(b-a)/nx; x=a+dx/2:dx:b;  % x: cell center
end

% Build IC
ICtest=1;
switch ICtest
    case 1
        q0 = CommonIC(x,Ic); % Choose between 1~9 cases
    case 2
        q0 = TestingIC(x);
    otherwise
        error('IC not listed!');
end
% Gradient of IC
dq0=gradient(q0,dx);

% Exact solution
qe = q0;

% Extra parameter: tolerance for LDLR scheme
tol=0.1*dx^(1.4);

% Plot Range
dl=0.1; plotrange=[a,b,min(q0)-2*dl,max(q0)+4*dl];
    
%% Solver Loop 

% Low storage Runge-Kutta coefficients
rk4a = [            0.0 ...
        -567301805773.0/1357537059087.0 ...
        -2404267990393.0/2016746695238.0 ...
        -3550918686646.0/2091501179385.0  ...
        -1275806237668.0/842570457699.0];
rk4b = [ 1432997174477.0/9575080441755.0 ...
         5161836677717.0/13612068292357.0 ...
         1720146321549.0/2090206949498.0  ...
         3134564353537.0/4481467310338.0  ...
         2277821191437.0/14882151754819.0];
% rk4c = [             0.0  ...
%          1432997174477.0/9575080441755.0 ...
%          2526269341429.0/6820363962896.0 ...
%          2006345519317.0/3224310063776.0 ...
%          2802321613138.0/2924317926251.0]; 

% When using a 4rd Order 5-stage SSPRK time integration
res_q = zeros(1,nx); % Runge-Kutta residual storage

% Time discretization
dt0=CFL*dx/abs(u);

% load initial conditions
q=q0; dt=dt0; it=0; t=0; dq=dq0; vsgn=sign(u);

% if RCIP
if method == 3
    % use a velocity field
    u = u*ones(size(x));
    
    % indexes
    isign = (u>=0) + (-1)*(u<=0);
    i = 2:nx-1;
    
    % initialized arrays
    S = zeros(1,nx);
    alpha = ones(1,nx);
    dx = zeros(1,nx);
    
    % costum cell sizes
    dx(i) = x(i-isign(i)) - x(i);
    dx(1) = abs(dx(2))*(-1)*isign(1);
    dx(nx) = abs(dx(nx-1))*(-1)*isign(nx);
end

while t < tEnd
    % Correction for final time step
    if t+dt>tEnd, dt=tEnd-t; end
        
    switch method
        case {1,2}  % CIP
            
            % Physical displacement
            xi=vsgn.*u*dt;
            
            % Displace info wrt to v
            qp=circshift(q,[0,vsgn]); dqp=circshift(dq,[0,vsgn]);
            
            % Compute CIP coeficients
            c1= (dq+dqp)/dx^2 + 2*(q-qp)/dx^3;
            c2= 3*(qp-q)/dx^2 - (2*dq+dqp)/dx;
            
            % Build F(x) and F'(x) polynomials
            qn= ((c1.*xi+c2).*xi+dq).*xi + q;
            dqn= (3*c1.*xi+2*c2).*xi + dq;
            
            % Monitonization of q by Oleg
            if method==2
                for k = 1:nx
                    if qn(k) > max(qp(k),q(k))
                        qn(k) = max(qp(k),q(k));
                    elseif qn(k) < min(qp(k),q(k))
                        qn(k) = min(qp(k),q(k));
                    end
                end
            end
            
            % qpdate
            q=qn; dq=dqn;
            
            % Periodic Boundary Conditions
            if u(1)>0; q(1)=q(nx); dq(1)=dq(nx); else q(nx)=q(1); dq(nx)=dq(1); end
            
        case 3  % RCIP
               
            % Physical displacement
            xi = (-1)*u*dt;
            
            % Slope
            S(i) = (q(i-isign(i))-q(i))./dx(i);
            S(1) = ( (isign(1)==1).*q(nx) + (isign(1)==-1).*q(2) - q(1))./dx(1);
            S(nx) = ( (isign(nx)==1).*q(nx-1) + (isign(nx)==-1).*q(1) - q(1))./dx(nx);
            
            % Beta coef
            beta = zeros(1,nx);
            for j=2:nx-1
                if(dq(j-isign(j))*dq(j)<0)
                    beta(j) = (abs((S(j)-dq(j))./(dq(j-isign(j))-S(j))) - 1)./dx(j);
                end
            end
            
            % Interpolation Coefs
            C0 = q;
            C1 = dq + q.*alpha.*beta;
            C3 = zeros(1,nx);
            C3(i) = (dq(i)-S(i) + (dq(i-isign(i))-S(i)).*(1 + alpha(i).*beta(i).*dx(i)) )./dx(i).^2;
            C3(1) = (dq(1)-S(1) + ((isign(1)==1).*dq(nx) + (isign(1)==-1).*dq(2) -S(1)).* ...
                (1 + alpha(1).*beta(1).*dx(1)) )./dx(1).^2;
            C3(nx) = (dq(nx)-S(nx) + ((isign(nx)==1).*dq(nx-1) + (isign(nx)==-1).*dq(1)-S(nx)).* ...
                (1 + alpha(nx).*beta(nx).*dx(nx)) )./dx(nx).^2;
            C2 = S.*alpha.*beta + (S-dq)./dx - C3.*dx;
            
            % sub-functions
            F0 = (1 + alpha.*beta.*xi);
            F1 = (C3.*xi.^3 + C2.*xi.^2 + C1.*xi + C0);
            F2 = (3*C3.*xi.^2 + 2*C2.*xi + C1);
            
            % Interpolation functions
            q = F1./F0; dq = F2./F0-alpha.*beta.*F1./F0.^2;
            
            % Periodic Boundary Conditions
            if u(1)>0; q(1)=q(nx); dq(1)=dq(nx); else q(nx)=q(1); dq(nx)=dq(1); end
            
        case 4  % CIP_CSL - case
            
        case 5  % LDLR
            
            % Initialization
            qo=q;
            
            % 1st stage
            dF = LDLRrhs(q,u,dx,nx,tol);
            q = qo-dt*dF;

            % 2nd Stage
            dF = LDLRrhs(q,u,dx,nx,tol);
            q = 0.75*qo+0.25*(q-dt*dF);

            % 3rd stage
            dF = LDLRrhs(q,u,dx,nx,tol);
            q = (qo+2*(q-dt*dF))/3;

        case 6  % WENO3 % SSP-RK3-3-stages 
            
            % Initialization
            qo=q;

            % 1st stage
            dF = WENO3rhs(q,u,dx);
            q = qo-dt*dF;

            % 2nd Stage
            dF = WENO3rhs(q,u,dx);
            q = 0.75*qo+0.25*(q-dt*dF);

            % 3rd stage
            dF = WENO3rhs(q,u,dx);
            q = (qo+2*(q-dt*dF))/3;
                    
        case 7  % WENO5 % LE-RK4-5-stages
            
            for RKs = 1:5
                %t_local = t + rk4c(RKs)*dt;
                dF = WENO5rhs(q,u,dx);
                res_q = rk4a(RKs)*res_q + dt*dF;
                q = q - rk4b(RKs)*res_q;
            end
            
        case 8  % WENO7 % LE-RK4-5-stages
            
            for RKs = 1:5
                %t_local = t + rk4c(RKs)*dt;
                dF = WENO7rhs(q,u,dx);
                res_q = rk4a(RKs)*res_q + dt*dF;
                q = q - rk4b(RKs)*res_q;
            end

        otherwise
            error('method not available');
    end
    
    % Update time and iteration counter
    t=t+dt; it=it+1;
    
	% Plot solution   
%     if rem(it,50) == 0
%        figure(2); plot(x,q0,'-k',x,q,'.r'); axis(plotrange);
%        set(gca,'dataaspectratio',[1.1 2 1]); grid on; shg; drawnow;
%     end
end

%% Final Plot
% figure(2); plot(x,q0,'-k',x,q,'.r'); axis(plotrange); grid on; 
% 
% switch method
%     case 1; scheme='CIP0';
% 	case 2; scheme='CIP1';
%     case 3; scheme='RCIP';
% 	case 4; scheme='CIP-CSL';
%     case 5; scheme='LDLR';
%     case 6; scheme='WENO3';
% 	case 7; scheme='WENO5';
% 	case 8; scheme='WENO7';
% end
% 
% legend(scheme,'Exact','Location','NorthEast'); legend('boxoff'); 
% set(gca,'dataaspectratio',[1.1 2 1]);

%% Compute Norms

% L1 Error
L1_norm = sum(abs(q-qe))/nx;

% L\infty Error
Linf_norm = max(abs(q-qe));