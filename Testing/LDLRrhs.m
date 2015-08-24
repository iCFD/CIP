function rhs = LDLRrhs(uo,v,h,nx,tol)
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vectorized LDLR Formulation of the RHS advective term
% coded by Manuel Diaz, NTU, 2015.08.01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Refs:
% [1] Artebrant, Robert, and H. Joachim Schroll. "Limiter-free third order
%     logarithmic reconstruction." SIAM Journal on Scientific Computing
%     28.1 (2006): 359-381. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Constants parameters
q=1.4;

% Initializa Arrays      % uo: u_{ i }^{n},
um=circshift(uo,[0,-1]); % um: u_{i-1}^{n},
up=circshift(uo,[0,+1]); % up: u_{i+1}^{n}.

% Slopes
d1=(uo-um)/h; d2=(up-uo)/h;

% Coefficients
a=(1-tol)*(1+tol-( (2*abs(d1).^q.*abs(d2).^q)+tol)./...
    (abs(d1).^(2*q)+abs(d2).^(2*q)+tol) ); % a(d1,d2)
b=a./(a-1); c=(a-1).*(d2.*(1-b)-d1)./(b-a); d=d1-c;

% Left and Right approx for u_{i+1/2}
uL=uo+(c*h).*nEta(a)+(d*h).*nEta(b); 
uR=circshift(uo+(c*h).*pEta(a)+(d*h).*pEta(b),[0,-1]);

% Numerical Flux: Lax Friedrichs
LF=0.5*(v*(uL+uR)-abs(v)*(uR-uL));

% RHS
rhs = (LF-circshift(LF,[0,1]))/h;

end

% $\eta(t)$ functions:
function eta=pEta(t); eta=-(log(1-t)+t)./t.^2; eta(t==0)=0.5; end
function eta=nEta(t); eta=((t-1).*log(1-t)-t)./t.^2; eta(t==0)=-0.5; end