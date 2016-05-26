%%%%%%%%%%%% Example %%%%%%%%%%%%%%%
%  y''+ 4 y = 4x^2 +2
%exact = x^2
%%%%%%%%%%%%%%%%% CIP0 %%%%%%%%%%%%%%%%%%
clc
clear all  %#ok<*CLSCR>
close all
format long
%% trial data
n=10;
a=0;
b=1;
h = (b-a)/n; 
syms xxx
ff = 4*xxx^2 +2;
%% Enter the knot sequences
x = zeros(((b-a)/h),1);
for i = 1:((b-a)/h)+1
    x(i) = a + (i-1)*h;
end
%% Boundary conditions
a1 = 0; %%% at f(a)=
b1 = 1;%%%% at f(b) = 

f = zeros(n+1,1);
for  i = 2:n
 f(i) = innercip0(x(i),h,ff); 
end
% syms qq
% [phmin,phplus] = phai(qq,h);
% phpmin2 = subs(phmin,qq,(qq-b));
% f(1)= int(phplus*(qq^2),qq,a,a+h);
% f(n+1)= int(phpmin2*(qq^2),qq,b-h,b);
f(1)= a1;
f(n+1)= b1;

%% the coeff matrix
[ph0,phdash0,ph2dash0] = matriciescip0(n,h);
AA = ph2dash0 + 4*ph0;
AA(1,:) = zeros(1,n+1);AA(n+1,:) = zeros(1,n+1);
AA(1,1) = 1;
AA(n+1,n+1) =  1;
 %% Exact
Exactcip0 = zeros(n+1,1);
for i = 1:n+1
   Exactcip0(i) = (x(i))^2; 
end
%% Error
coeffcip0 =AA\f; 
figure(1)
plot(x,Exactcip0,'-ro',x,coeffcip0,'-.b')
h = legend('Exact','Approximate',2);
set(h,'Interpreter','none')
max(abs(Exactcip0-coeffcip0))
figure(2)
plot(abs(Exactcip0-coeffcip0))

