function [du] = minGradient(u,dx)

% Parameters
n=numel(u); %tol=10e-4;

% forward derivative
duf=zeros(n,1); duf(1:n-1)=( u(2:n)-u(1:n-1) )./dx(1:n-1);
duf(n)=(u(n)-u(n-1))/dx(n-1);             

% backward derivative
dub = zeros(n,1); dub(2:n)=( u(2:n)-u(1:n-1) )./dx(1:n-1);     
dub(1)=(u(2)-u(1))/dx(1);                 

% minimum derivative
du = dub;                                        
iless = abs(duf) < abs(dub);                     
du(iless)=duf(iless);
%du(abs(duf+dub)<tol)=0.0;