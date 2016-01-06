function [out1, out2] = ua_nln_samples(id,x,t,l1,l2)

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                   Exact solutions of quasilinear transport equation 
%                           u_t + f(u)_x = 0, f(u) = 0.5*u.^2;
%                              with speed equals one
%                       
%                    coded by Oleg Kravchenko 2015.12.21
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Refs:
% [1] Link: http://baumanpress.ru/books/337/ (page 437, in russian)
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

L = l2-l1;

if t == 0
    switch id
        case 1 % Triangle
            p1 = @(x,t,l1,l2) x>=l1 & x<=0.5*(l1+l2);
            p2 = @(x,t,l1,l2) x>=0.5*(l1+l2) & x<=l2;
            p3 = @(x,t,l1,l2) x< l1 & x> l2;
            
            f1 = @(x,t,l1,l2) 2*(x-l1)/L;
            f2 = @(x,t,l1,l2) 2*(l2-x)/L;
            f3 = @(x,t,l1,l2) 0;
            
            f = @(x,t,l1,l2) p1(x,t,l1,l2).*f1(x,t,l1,l2) + p2(x,t,l1,l2).*f2(x,t,l1,l2)+ ...
                p3(x,t,l1,l2).*f3(x,t,l1,l2);
            
            out1 = f(x,t,l1,l2);
        case 2 % Rectangle
            p1 = @(x,t,l1,l2) x>=l1 & x<=l2;
            p2 = @(x,t,l1,l2) x< l1 & x> l2;            
            
            f1 = @(x,t,l1,l2) 1;
            f2 = @(x,t,l1,l2) 0;            
            
            f = @(x,t,l1,l2) p1(x,t,l1,l2).*f1(x,t,l1,l2) + p2(x,t,l1,l2).*f2(x,t,l1,l2);                
            
            out1 = f(x,t,l1,l2);            
        case 3 % Left triangle
            p1 = @(x,t,l1,l2) x>=l1 & x<=l2;
            p2 = @(x,t,l1,l2) x< l1 & x> l2;            
            
            f1 = @(x,t,l1,l2) (x-l1)/L;
            f2 = @(x,t,l1,l2) 0;            
            
            f = @(x,t,l1,l2) p1(x,t,l1,l2).*f1(x,t,l1,l2) + p2(x,t,l1,l2).*f2(x,t,l1,l2);                
            
            out1 = f(x,t,l1,l2);            
        case 4 % Right triangle
            p1 = @(x,t,l1,l2) x>=l1 & x<=l2;
            p2 = @(x,t,l1,l2) x< l1 & x> l2;            
            
            f1 = @(x,t,l1,l2) (l2-x)/L;
            f2 = @(x,t,l1,l2) 0;            
            
            f = @(x,t,l1,l2) p1(x,t,l1,l2).*f1(x,t,l1,l2) + p2(x,t,l1,l2).*f2(x,t,l1,l2);                
            
            out1 = f(x,t,l1,l2);                        
        case 5 % Step down            
            p1 = @(x,t,l1,l2) x<=l1;
            p2 = @(x,t,l1,l2) x>=l1;            
            
            f1 = @(x,t,l1,l2) 1;
            f2 = @(x,t,l1,l2) 0;            
            
            f = @(x,t,l1,l2) p1(x,t,l1,l2).*f1(x,t,l1,l2) + p2(x,t,l1,l2).*f2(x,t,l1,l2);                
            
            out1 = f(x,t,l1,l2);            
        case 6 % Step up            
            p1 = @(x,t,l1,l2) x<=l1;
            p2 = @(x,t,l1,l2) x>=l1;           
            
            f1 = @(x,t,l1,l2) 0;
            f2 = @(x,t,l1,l2) 1;            
            
            f = @(x,t,l1,l2) p1(x,t,l1,l2).*f1(x,t,l1,l2) + p2(x,t,l1,l2).*f2(x,t,l1,l2);                
            
            out1 = f(x,t,l1,l2);            
        otherwise
            out1 = 0*x;
    end
else
    switch id
        case 1 % Triangle (doesn't work if t = L/2)
            p1 = @(x,t,l1,l2) (x>=l1) & (x<=0.5*(l1+l2)+t) & (0<t) & (t<=0.5*L);
            p2 = @(x,t,l1,l2) (x>=0.5*(l1+l2)+t) & (x<=l2) & (0<t) & (t<=0.5*L);
            p3 = @(x,t,l1,l2) (x< l1) & (x> l2) & t<=0.5*L;
            p4 = @(x,t,l1,l2) (x>=l1) & (x<=l1+sqrt(0.5*L*(L+2*t))) & t>0.5*L;
            p5 = @(x,t,l1,l2) (x< l1) & (x> l1+sqrt(0.5*L*(L+2*t))) & t>0.5*L;
            
            f1 = @(x,t,l1,l2) 2*(x-l1)/(L+2*t);
            f2 = @(x,t,l1,l2) 2*(l2-x)/(L-2*t);
            f3 = @(x,t,l1,l2) 0;
            f4 = @(x,t,l1,l2) 2*(x-l1)/(L+2*t);
            f5 = @(x,t,l1,l2) 0;
            
            f = @(x,t,l1,l2) p1(x,t,l1,l2).*f1(x,t,l1,l2) + p2(x,t,l1,l2).*f2(x,t,l1,l2) + ...
                p3(x,t,l1,l2).*f3(x,t,l1,l2) + p4(x,t,l1,l2).*f4(x,t,l1,l2) + p5(x,t,l1,l2).*f5(x,t,l1,l2);
            
            out1 = f(x,t,l1,l2);
            
        case 2 % Rectangle
            p1 = @(x,t,l1,l2) (x>=l1) & (x<=l1+t) & (0<t) & (t<=2*L);
            p2 = @(x,t,l1,l2) (x>=l1+t) & (x<=l2+0.5*t) & (0<t) & (t<=2*L);
            p3 = @(x,t,l1,l2) (x< l1) & (x> l2) & t<=2*L;
            p4 = @(x,t,l1,l2) (x>=l1) & (x<=l1+sqrt(2*L*t)) & t>2*L;
            p5 = @(x,t,l1,l2) (x< l1) & (x> l1+sqrt(2*L*t)) & t>2*L;
            
            f1 = @(x,t,l1,l2) (x-l1)/t;
            f2 = @(x,t,l1,l2) 1;
            f3 = @(x,t,l1,l2) 0;
            f4 = @(x,t,l1,l2) (x-l1)/t;
            f5 = @(x,t,l1,l2) 0;
            
            f = @(x,t,l1,l2) p1(x,t,l1,l2).*f1(x,t,l1,l2) + p2(x,t,l1,l2).*f2(x,t,l1,l2) + ...
                p3(x,t,l1,l2).*f3(x,t,l1,l2) + p4(x,t,l1,l2).*f4(x,t,l1,l2) + p5(x,t,l1,l2).*f5(x,t,l1,l2);
            
            out1 = f(x,t,l1,l2);
            
        case 3 % Left triangle
            p1 = @(x,t,l1,l2) (x>=l1) & (x<=l1+sqrt(L*(t+L)));
            p2 = @(x,t,l1,l2) (x< l1) & (x> l1+sqrt(L*(t+L)));
            
            f1 = @(x,t,l1,l2) (x-l1)/(t+L);
            f2 = @(x,t,l1,l2) 0;
            
            f = @(x,t,l1,l2) p1(x,t,l1,l2).*f1(x,t,l1,l2) + p2(x,t,l1,l2).*f2(x,t,l1,l2);
            
            out1 = f(x,t,l1,l2);
            
        case 4 % Right triangle (doesn't work if t = L)
            p1 = @(x,t,l1,l2) x>=l1 & x<=l1+t & 0<t & t<=L;
            p2 = @(x,t,l1,l2) (x>=l1+t) & (x<=l2) & (0<t) & (t<=L);
            p3 = @(x,t,l1,l2) (x< l1) & (x> l2) & t<=L;
            p4 = @(x,t,l1,l2) (x>=l1) & (x<=l1+sqrt(L*t)) & t>L;
            p5 = @(x,t,l1,l2) (x< l1) & (x> l1+sqrt(L*t)) & t>L;
            
            f1 = @(x,t,l1,l2) (x-l1)/t;
            f2 = @(x,t,l1,l2) (l2-x)/(L-t);
            f3 = @(x,t,l1,l2) 0;
            f4 = @(x,t,l1,l2) (x-l1)/t;
            f5 = @(x,t,l1,l2) 0;
            
            f = @(x,t,l1,l2) p1(x,t,l1,l2).*f1(x,t,l1,l2) + p2(x,t,l1,l2).*f2(x,t,l1,l2) + ...
                p3(x,t,l1,l2).*f3(x,t,l1,l2) + p4(x,t,l1,l2).*f4(x,t,l1,l2) + p5(x,t,l1,l2).*f5(x,t,l1,l2);
            
            out1 = f(x,t,l1,l2);
            
        case 5 % Step down
            p1 = @(x,t,l1,l2) x <= l1 + 0.5*t;
            p2 = @(x,t,l1,l2) x >  l1 + 0.5*t;
            
            f1 = @(x,t,l1,l2) 1;
            f2 = @(x,t,l1,l2) 0;
            
            f = @(x,t,l1,l2) p1(x,t,l1,l2).*f1(x,t,l1,l2) + p2(x,t,l1,l2).*f2(x,t,l1,l2);
            
            out1 = f(x,t,l1,l2);
        case 6 % Step up
            p1 = @(x,t,l1,l2) x <= l1;
            p2 = @(x,t,l1,l2) x >=l1 & x<=l1+t;
            p3 = @(x,t,l1,l2) x >  l1+t;
            
            f1 = @(x,t,l1,l2) 0;
            f2 = @(x,t,l1,l2) (x-l1)/t;
            f3 = @(x,t,l1,l2) 1;
            
            f = @(x,t,l1,l2) p1(x,t,l1,l2).*f1(x,t,l1,l2) + p2(x,t,l1,l2).*f2(x,t,l1,l2) + ...
                p3(x,t,l1,l2).*f3(x,t,l1,l2);
            
            out1 = f(x,t,l1,l2);
        otherwise
            out1 = zeros(1,length(x));
    end
end % if

% First derivative
h       = x(2) - x(1);
nx      = length(x);
out2    = [out1(1) 0.5*(out1(3:nx)-out1(1:nx-2))/h out1(end)];
