function [fb, fb_x] = riemann(u, v, xi, nx, ns)

fe      = zeros(1,ns);
f_l     = zeros(1,nx);
f_r     = f_l;
fx_l    = f_l;
fx_r    = f_l;


for i = 1:nx
    for k = 1:ns
        fe(k) = v(i,k) * u(i,k);
    end % k
    
    f_l(i)  = f_primary(-1, xi, ns, fe);
    f_r(i)  = f_primary(+1, xi, ns, fe);
    fx_l(i) = fx_primary(-1, xi, ns, fe);
    fx_r(i) = fx_primary(+1, xi, ns, fe);
end % for i

f_l     = bcd_f(f_l,  nx);
f_r     = bcd_f(f_r,  nx);
fx_l    = bcd_f(fx_l, nx);
fx_r    = bcd_f(fx_r, nx);


for i = 1:nx
    if v(i,1) >= 0
        fb(i)   = f_r(i-1);
        fb_x(i) = fx_r(i-1);
    else
        fb(i)   = f_l(i);
        fb_x(i) = fx_r(i);
    end % if
end % for

fb      = bdc_f(fb, nx);
fb_x    = bdc_f(fb_x, nx);