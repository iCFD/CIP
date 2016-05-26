%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%          A symbolic derivation of CIP method coefficients
%                   by Oleg Kravchenko, BMSTU, 2016.05.26
%
%           CIPN: N-th order polynomial
%                   f(x) = \sum_{k=0}^N a_k*x^k,
%           Information up to N-th derivative
%                   f_p, f'_p, f''_p, ... , f^(N-1)_p,
%           where p = i-1,i for unwind stencil or
%                 p = i,i+1 for downwind stencil
% 
%                   Stencil (upwind, c>0 )
%                         o n+1
%                         |
%                   o-----o n
%                   i-1   i
%                    Stencil (downwind, c<0 )
%                   o       n+1
%                   |
%                   o-----o n
%                   i     i+1
%
%	CIP method is a Constraint Interpolation profile method for linear 
%   which have been introduced for the first time to numerical solution
%   of transport equation f_t + c f_x = 0.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	Refs:
%   [1] Takashi Yabe, Takayuki Aoki, Gyo Sakaguchi, Pei-Yuan Wang, 
%   Takeo Ishikawa. The compact CIP (cubic-interpolated pseudo-particle) 
%   method as a general hyperbolic solver. 
%   Vol. 19, Issues 3–4, 1991, P. 421-431 
%   DOI: 10.1016/0045-7930(91)90067-R
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all; close all; clc;

% Symbolic variables
syms x h a0 a1 a2 a3 a4 a5 a6 ...
    f_i f_im1 f_ip1 ...
    g_i g_im1 g_ip1 ...
    h_i h_im1 h_ip1

%% CIP3 (N=3)
% Interpolation polynomial
f   = symfun(sum([a0 a1 a2 a3].*[1 x x.^2 x.^3]), [a0 a1 a2 a3 x]);
d1f = diff(f,x);

% Constrains (Upwind)
eqn1 = subs(f,x, 0)     == f_i;
eqn2 = subs(f,x,-h)     == f_im1;
eqn3 = subs(d1f,x, 0)   == g_i;
eqn4 = subs(d1f,x,-h)   == g_im1;
% Solution of System of equations
sol_uwd = solve([eqn1, eqn2, eqn3, eqn4], [a0, a1, a2, a3]);
% Disp a0 .. a3 coefficients
disp(['Upwind', 10])
disp(['CIP3 cubic polynomial f(x) = a0 + a1x + a2x^2 + a3x^3:', 10])
disp([a0 sol_uwd.a0; a1 sol_uwd.a1; a2 sol_uwd.a2; a3 sol_uwd.a3])

% Constrains (Downwind)
eqn1 = subs(f,x, 0)     == f_i;
eqn2 = subs(f,x, h)     == f_ip1;
eqn3 = subs(d1f,x, 0)   == g_i;
eqn4 = subs(d1f,x, h)   == g_ip1;
% Solution of System of equations
sol_dwd = solve([eqn1, eqn2, eqn3, eqn4], [a0, a1, a2, a3]);
% Disp a0 .. a3 coefficients
disp(['Downwind', 10])
disp(['CIP3 cubic polynomial f(x) = a0 + a1x + a2x^2 + a3x^3:', 10])
disp([a0 sol_dwd.a0; a1 sol_dwd.a1; a2 sol_dwd.a2; a3 sol_dwd.a3])


%% CIP5 (N=5)
% Interpolation polynomial
f   = symfun(sum([a0 a1 a2 a3 a4 a5].*[1 x x.^2 x.^3 x.^4 x.^5]), [a0 a1 a2 a3 a4 a5 x]);
d1f = diff(f,x);
d2f = diff(d1f,x);

% Constrains (Upwind)
eqn1 = subs(f,x, 0)     == f_i;
eqn2 = subs(f,x,-h)     == f_im1;
eqn3 = subs(d1f,x, 0)   == g_i;
eqn4 = subs(d1f,x,-h)   == g_im1;
eqn5 = subs(d2f,x, 0)   == h_i;
eqn6 = subs(d2f,x,-h)   == h_im1;
% Solution of System of equations
sol_uwd = solve([eqn1, eqn2, eqn3, eqn4, eqn5, eqn6], [a0, a1, a2, a3, a4, a5]);
% Disp a0 .. a5 coefficients
disp(['Upwind', 10])
disp(['CIP5 cubic polynomial f(x) = a0 + a1x + a2x^2 + a3x^3 + a4x^4 + a5x^5:', 10])
disp([a0 sol_uwd.a0; a1 sol_uwd.a1; a2 sol_uwd.a2; a3 sol_uwd.a3; ...
    a4 sol_uwd.a4; a5 sol_uwd.a5])

% Constrains (Downwind)
eqn1 = subs(f,x, 0)     == f_i;
eqn2 = subs(f,x, h)     == f_ip1;
eqn3 = subs(d1f,x, 0)   == g_i;
eqn4 = subs(d1f,x, h)   == g_ip1;
eqn5 = subs(d2f,x, 0)   == h_i;
eqn6 = subs(d2f,x, h)   == h_ip1;
% Solution of System of equations
sol_dwd = solve([eqn1, eqn2, eqn3, eqn4, eqn5, eqn6], [a0, a1, a2, a3, a4, a5]);
% Disp a0 .. a3 coefficients
disp(['Downwind', 10])
disp(['CIP5 cubic polynomial f(x) = a0 + a1x + a2x^2 + a3x^3 + a4x^4 + a5x^5:', 10])
disp([a0 sol_dwd.a0; a1 sol_dwd.a1; a2 sol_dwd.a2; a3 sol_dwd.a3; ...
    a4 sol_dwd.a4; a5 sol_dwd.a5])