function output = mflux_x(u, v, fm_x, xi, dx, nx, ns, ischeme)

% f = u .* v;

[fb, fb_x] = riemann(u, v, xi, nx, ns);

for i = 1:nx
    if ischeme == 1
        % MCV3
        fm_x(i, 1) = 2.0/dx * fb_x(i);
        fm_x(i, 2) = 2.0/dx * (3.0*(fb(i+1)-fb(i)) - fb_x(i) - fb_x(i+1))/4.0;
        fm_x(i, 3) = 2.0/dx * fb_x(i+1);
    elseif ischeme == 2
        fm_x = zeros(nx, 3);    
    else
        fm_x = zeros(nx, 3);
    end % if
end % for

output = bdc(fm_x, nx, ns);
        
