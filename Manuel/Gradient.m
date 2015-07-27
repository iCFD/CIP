function [du] = Gradient(u,dx)

% Parameters
n=numel(u); 

% central derivatives
du=zeros(n,1); du(2:n-1)=( u(3:n)-u(1:n-2) )./dx(2:n-1);

% derivatives at boundaries
du(1)=(u(2)-u(1))/dx(1);	du(n)=(u(n)-u(n-1))/dx(n-1);  
