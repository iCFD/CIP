function [output1, output2, bc1, bc2] = ic(id, x, c)

switch id
    case 1 % step       
        output1 = zeros(1,length(x));
        output1((x-.3)<0)=1;        
    case 2 % double step
        output1 = zeros(1,length(x));
        output1(1:ceil(0.1*length(x))) = 1;
        output1(ceil(0.1*length(x))+1:ceil(0.2*length(x))) = 0.5;
    case 3 % unitbox
        output1 = rectangularPulse(0.1, 0.3, x);
    case 4 % exponenta
        tmp = rectangularPulse(0.1, 0.3, x);
        output1 = exp(-x) .* tmp * exp(.1);
    case 5 % cos
        tmp = rectangularPulse(0.1, 0.3, x);
        output1 = cos(5*pi*(x-1)) .* tmp;
    case 6 % triangle
        output1 = triangularPulse(0.1, 0.3, x);        
    case 7
        output1 = sin(pi*x/20);
    case 8
        output1 = zeros(1,length(x));
        output1((x-.51)>=0)=1;        
    case 9
        output1 = sin(2 * pi * x);     
    otherwise
        output1 = zeros(1,length(x));
end

h       = x(2) - x(1);
output2 = 0.5 * (output1(3:end) - output1(1:end-2)) / h;
output2 = [output2(1) output2 output2(end)];
bc1     = output1(1);
bc2     = - output2(1) / c;