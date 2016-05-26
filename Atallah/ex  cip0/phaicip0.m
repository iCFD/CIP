function [ phmin,phplus] = phaicip0(xxx,h)
%PHAI Summary of this function goes here
%   Detailed explanation goes here
% syms xx
phmin = 1 + xxx/h;
phplus = 1 - xxx/h;
end

