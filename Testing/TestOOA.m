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

%% Setup Plot Configuration
% set(0,'defaultTextInterpreter','none') 
set(0,'defaultTextInterpreter','latex')
set(0,'DefaultTextFontName','Times',...
'DefaultTextFontSize',18,...
'DefaultAxesFontName','Times',...
'DefaultAxesFontSize',18,...
'DefaultLineLineWidth',1.5,...
'DefaultAxesBox','on',...
'defaultAxesLineWidth',1.5,...
'DefaultFigureColor','w',...
'DefaultLineMarkerSize',5.5)
%-------------------------------------------------------------------------
color=['k','r','g','c','m','b','y','w','none'];
lines={'-',':','--','-.','-.',' '};
mark=['s','+','o','x','v',' '];

% Figures Saving Path
path ='~/github/CIP/TeX/figures/';

% Labels
label_Norm1='$\log ||e||_1$';
label_NormI='$\log ||e||_\infty$';
label_dx='$\log_{10} N_x $';
L1Norm='$L_1$ Norm';
LINorm='$L_\infty$ Norm';

% name (if we test any particular parameter or IC)
%name='_Sinusoidal';
name='_Gaussian';

% plot range 
plotrange = [10,1000,1e-13,1];

%% Test Parameters
   u = -1.0; % advection velocity
tEnd = 2.0; % One cycle for every test
  IC = 1;   % initial condition (see CommonIC.m!)

% Parameters
mlist = {'CIP0','CPI1','RCIP','CPI-CSL','LDLR','WENO3','WENO5','WENO7'};
mth = [1,2,3,5,6,7,8]; % choose from the list above by placement number.
cfl = [0.9,0.9,0.9,0.9,0.8,0.5,0.2]; % one CFL for every method!
nx  = [20,40,80,160,320,640]; % number of cells to use in every test.

% Number of parameters
p1 = numel(mth);
p2 = numel(nx);

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
plotfigs = 1;
if plotfigs == true
    figure(1)
    loglog(nx,Norm(:,1,1),'-*',...
        nx,Norm(:,1,2),'--+',...
        nx,Norm(:,1,3),':s',...
        nx,Norm(:,1,4),'-.x',...
        nx,Norm(:,1,5),'--h',...
        nx,Norm(:,1,6),'--p',...
        nx,Norm(:,1,7),'--o')
    % Axis
    axis(plotrange);
    % Legend
    legend(mlist(mth),'location','southwest','FontSize',12); legend('boxoff'); grid on;
    % Title
    title(L1Norm);
    % Axis labels
    ylabel(label_Norm1);
    xlabel(label_dx);
    % Shape ratio
    set(gca,'dataaspectratio',[1.2 0.001 1]);
    % Print Figure
    print('-depsc',[path,'NormL1',name,'.eps']);
    
    figure(2)
    loglog(nx,Norm(:,2,1),'-*',...
        nx,Norm(:,2,2),'--+',...
        nx,Norm(:,2,3),':s',...
        nx,Norm(:,2,4),'-.x',...
        nx,Norm(:,2,5),'--h',...
        nx,Norm(:,2,6),'--p',...
        nx,Norm(:,2,7),'--o')
    % Axis
    axis(plotrange);
    % Legend
    legend(mlist(mth),'location','southwest','FontSize',12); legend('boxoff'); grid on;
    % Title
    title(LINorm);
    % Axis labels
    ylabel(label_NormI);
    xlabel(label_dx);
    % Shape Ratio
    set(gca,'dataaspectratio',[1.2 0.001 1]);
    % Print Figure
    print('-depsc',[path,'NormLinf',name,'.eps']);
end

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