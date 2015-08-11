function output = bcd_f(f, nx)

output = f;

output(1)       = output (nx+1);
output(nx+2)    = output (2);