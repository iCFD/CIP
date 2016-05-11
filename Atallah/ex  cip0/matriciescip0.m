function [ph0,phdash0,ph2dash0] = matriciescip0(n,h)
%MATRICIES Summary of this function goes here
%   Detailed explanation goes here
ph0 = zeros(n+1,n+1);
phdash0 = zeros(n+1,n+1);
ph2dash0 = zeros(n+1,n+1); 
for  i = 2:n
   ph0(i,i-1:i+1)=(h/6)*[1 4 1];
   phdash0(i,i-1:i+1)=(1/2)*[-1 0 1];
   ph2dash0(i,i-1:i+1)=(1/h)*[1 -2 1];
end
ph0(1,1:2) = (h/6)*[2,1];
ph0(n+1,n:n+1) = (h/6)*[1,2];
phdash0(1,1:2) = (1/2)*[1/2,1];
phdash0(n+1,n:n+1) = (1/2)*[-1 -1/2];
ph2dash0(1,1:2) = (1/h)*[-1 1];
ph2dash0(n+1,n:n+1) = (1/h)*[1 -1];
end
