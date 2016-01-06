
clc
% clear all
close all

offset  = 0.15;
id      = 3;
l2      = 1;
l1      = 0;
x       = linspace(-2,4, 2^9);
t0      = 0;
tfin    = 5;
dt      = 1e-2;
[y0, dy0] = ua_nln_samples(id,x,t0,l1,l2);

figure(1),
[hAx,hLine1,hLine2] = plotyy(x, y0, x, dy0);
% ylim([min([y dy])-offset max([y dy])+offset])
hLine1.LineStyle = '-';
hLine2.LineStyle = '-';


figure(2),

for t=t0:dt:tfin
    y = ua_nln_samples(id,x,t,l1,l2);
    plot(x, y, '.-', x, y0, 'k')
    ylim([0-offset 1.05+offset])
    xlabel('$x$','Interpreter','latex','Fontsize',12)
    ylabel('$u(x,t)$','Interpreter','latex','Fontsize',12)
    title('Evolution of exact solution $u(x,t)$ inviscid Burgers ...equation',...
        'Interpreter','latex','Fontsize',12)

    text(0.76,-0.1,['time: ' num2str(t,'%-5.2f') ' / ' num2str(tfin,'%-5.2f')])
    
    drawnow
%     pause(0.1)    
    disp(t)
end

