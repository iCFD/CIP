%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Solving 1-D wave equation with Finite Difference & Finite Volume Methods
%
%               dq/dt + df/dx = 0,  for x \in [a,b]
%              where f = u*q :: linear flux function
%
%              coded by Manuel Diaz, NTU, 2015.08.21
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; close all;

% Fixed Parameters
   u = 1.0; % advection velocity
tEnd = 2.0; % One cycle for every test
  IC = 1;   % initial condition (see CommonIC.m!)

% Parameters
mlist = {'CIP0','CPI1','RCIP','CPI-CSL','LDLR','WENO3','WENO5','WENO7'};
mth = [1,2,3,5,6,7,8]; % choose from the list above by placement number.
cfl = [0.9,0.9,0.9,0.9,0.8,0.5,0.2]; % one CFL for every method!
nx  = [20,40,80,160,320,640]; % number of cells to use in every test.

% Number of parameters
p1 = length(mth);
p2 = length(nx);

% Allocate space for results
table = zeros(p2,2,p1,3);
Norm = zeros(size(table));
OOA = zeros(size(table));

%% Compute L1 and L\infty norms
for l = 1:p1
    for n = 1:p2
        tic
        [Norm(n,1,l),Norm(n,2,l)]=TestMethods(u,cfl(l),tEnd,IC,nx(n),mth(l));
        toc
    end
end

%% Compute the Order of Accuracy (OOA)
for l = 1:p1
    for n = 2:p2
        OOA(n,1,l) = log(Norm(n-1,1,l)/Norm(n,1,l))/log(2);
        OOA(n,2,l) = log(Norm(n-1,2,l)/Norm(n,2,l))/log(2);
    end
end

%% Plot figure with results
figure(1)
loglog(nx,Norm(:,1,1),'-s',...
    nx,Norm(:,1,2),'-o',...
    nx,Norm(:,1,3),'-h',...
    nx,Norm(:,1,4),'-<',...
    nx,Norm(:,1,5),'-h',...
    nx,Norm(:,1,6),'-o',...
    nx,Norm(:,1,7),'-s')
legend(mlist(mth),'location','southwest'); title('L_1 norm')

figure(2)
loglog(nx,Norm(:,2,1),'-s',...
    nx,Norm(:,2,2),'-o',...
    nx,Norm(:,2,3),'-h',...
    nx,Norm(:,2,4),'-<',...
    nx,Norm(:,2,5),'-h',...
    nx,Norm(:,2,6),'-o',...
    nx,Norm(:,2,7),'-s')
legend(mlist(mth),'location','southwest'); title('L_\infty norm')

%% Display Result
for l = 1:p1
    fprintf('***************************************************************\n')
    fprintf(' Method: %s\n',mlist{mth(l)});
    fprintf('***************************************************************\n')
    fprintf(' nE \t L1-Norm \t Degree \t Linf-Norm \t Degree\n');
    for n = 1:p2
        fprintf('%3.0f \t %1.2e \t %2.2f \t\t %1.2e \t %2.2f \n',...
        nx(n),Norm(n,1,l),OOA(n,1,l),Norm(n,2,l),OOA(n,2,l));
    end
end
fprintf('\n');
% By observing the degree of accuaracy with respect to the CFL number, it
% is suggested that we should tune the CFL condition for each case in order
% to get the fastest, stable and most accuarate solution.

% Manuel Diaz, NTU, 2015.
% End of Test