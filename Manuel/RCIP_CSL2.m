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
    cfl = 0.20;	% CFL condition.
   tEnd = 2.0;	% final time.
     nx = 201;	% number of nodes.
 scheme = 0;	% {0}CIP0 and {1}CPI1.
    
% Build Mesh
a=-1; b=1; dx=(b-a)/(nx-1); x=a:dx:b; 

% Define Velocity Field functions
switch fluxfun
    case 'linear'
        advect = @(x) +1*ones(size(x));
    case 'sine'
        advect = @(x) 1.5+sin(2*pi*x);
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

p = zeros(1,(nx-1));
p(1:(nx-1),1) = (u(1:(nx-1))+ u(2:nx)).*dx(1:(nx-1))*0.5;


while t < tEnd 
    % Correction for final time step
    if t+dt>tEnd, dt=tEnd-t; end
        
%     % physical displacement
%     xi=vsgn.*v*dt;
%     
%     % Displace info wrt to v
%     up=circshift(u,[0,vsgn]); dup=circshift(du,[0,vsgn]);
%        
%     % Compute CIP coeficients
%     c1= (du+dup)/dx^2 + 2*(u-up)/dx^3;
%     c2= 3*(up-u)/dx^2 - (2*du+dup)/dx;
%     
%     % Build F(x) and F'(x) polynomials
%     un= ((c1.*xi+c2).*xi+du).*xi + u;
%     dun= (3*c1.*xi+2*c2).*xi + du;
%     
%     % Monitonization for u by Oleg
%     if scheme==1
%         for k = 1:nx
%             if un(k) > max(up(k),u(k))
%                 un(k) = max(up(k),u(k));
%             elseif un(k) < min(up(k),u(k))
%                 un(k) = min(up(k),u(k));
%             end
%         end
%     end

np = length(x);                        % N�mero de n�s.
nc = np-1;                             % N�mero de c�lulas
sgnu =zeros(1,np);
sgnu(2:np-1) = sign(v(2:np-1));
% ========================== indices ======================================
i =  (2:np-1);               % Se for linha o vetor sai coluna e vice versa
iup = i - sgnu(2:np-1);     % i upwind
ic = iup;                    % C�lula da "esquerda" quando vel. positiva
icel = find(sgnu < 0);
ic(icel-1) = icel;           % C�lula da "direita" quando vel. negativa
% ========================= declara��es ===================================
dx(1:nc,1) = x(2:np) - x(1:np-1);
du = minGradient(u,dx);                % Derivada usando minor gradients

e = -v.*dt;                            % Quanto cada celula se move em dt
e2 = e.*e;
e3 = e.*e2;

dxup = dx;
dxup(i) = x(iup) - x(i);               % Comprimento da c�lula upwind

% ========================== fase advectiva ===============================
S = zeros(1,(np-1));
S(i) = p(ic)./abs(dxup(i));

b = zeros(1,np);
% for k=2:np-1
%     kup = k - sgnu(k);
%     if ((f(kup)-S(k))~=0)
%         if (f(k)*f(kup)<=0)
%             b(k) = (abs((S(k)-f(k))./(f(kup)-S(k)))-1)./dxup(k);
%         else if (((S(k)-f(k))/(f(kup)-S(k)))>=0)
%                 b(k) = (abs((S(k)-f(k))./(f(kup)-S(k)))-1)./dxup(k);
%             end
%         end
%     end
% end

for k=2:np-1
    kup = k - sgnu(k);
    if ((u(kup)-S(k))~=0)
%         if (f(k)*f(kup)<=0)
%             b(k) = (abs((S(k)-f(k))./(f(kup)-S(k)))-1)./dxup(k);
%         else
            if (((S(k)-u(k))/(u(kup)-S(k)))>=0)
                b(k) = (abs((S(k)-u(k))./(u(kup)-S(k)))-1)./dxup(k);
            end
%         end
    end
end
C1 = zeros(1,np);
C1(i) = u(i);
C3 = zeros(1,np);
C3(i) = (u(i)-S(i) + (u(iup)-S(i)).*(1 + b(i).*dxup(i)))./(dxup(i).^2);
C2 = zeros(1,np);
C2(i) = S(i).*b(i) + (S(i)-u(i))./dxup(i) - C3(i).*dxup(i);
% massa que sai de cada celula
dp(i)  = (-1)*(C3(i).*e3(i) + C2(i).*e2(i) + C1(i).*e(i))./(1+b(i).*e(i));
% massa no proximo passo de tempo
p(2:(nc-1)) = p(2:(nc-1)) + dp(2:(np-2)) - dp(3:(np-1));
% derivada com um "shift"
u(i) = (3*C3(i).*e2(i) + 2*C2(i).*e(i) + C1(i))./(1 + b(i).*e(i)) - ...
  b(i).*(C3(i).*e3(i) + C2(i).*e2(i) + C1(i).*e(i))./((1+b(i).*e(i)).^2);
% % ========================== fase difusiva ================================
% G = (-1)*f.*du;
% f = f + dt*G;                       % Difus�o da fun��o
    
    % Update 
    %u=un; du=dun;
    
    % Periodic Boundary Conditions
%     if (v(1)>0)
%         u(1) = u(np);
%     else
%         u(np) = u(1);
%     end
    %u(1)=u(nx); du(1)=du(nx);
    u(nx)=u(1); du(nx)=du(1);
    
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