function output = bcd(u, nx, ns)

output = u;

output(1,:)       = output (nx+1,:);
output(nx+2,:)    = output (2,:);