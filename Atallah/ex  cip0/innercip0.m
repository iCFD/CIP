function [ fi] = innercip0( xi , h,ff1)
%INNER Summary of this function goes here
%   Detailed explanation goes here
syms xx;
ff = subs(ff1,xx);
[phmini,phplusi] = phaicip0((xx-xi),h);
fi = int(phmini*ff,xx,xi-h,xi) + int(phplusi*ff,xx,xi,xi+h);
end

