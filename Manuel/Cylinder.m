function u = Cylinder(x,y)
%% Build Test Cilinder
% coded by Manuel Diaz, NTU, 2015.04.12.

% Domain Lengths
lx = x(1,end)-x(1,1);
ly = y(end,1)-y(1,1);

% Just in case the test domain is not square
if lx==ly; L=lx; elseif lx>ly; L=ly; else L=lx; end

% Contruction Parameters
R = 0.25*L; % Rotation Radio, 
r = 0.15*L; % Cylinder's Radio, 
h = 0.90;	% Cylinder's Height,
ec= 0.03*L; % Inner cut width,
lc= 0.08*L; % Length of the inner cut, 
fr= 0.10;   % floor reference.

% Domain's center (also the center of rotation)
xc = 0.5*(x(1:1)+x(1,end));
yc = 0.5*(x(1:1)+x(1,end));

% Build testing cylinder
u = fr*ones(size(x)) ... % the base height
  + (h-fr)*((x-xc).^2+(y-yc-R).^2 <= r^2) ... % the cylinder
  - (h-fr)*((x<=xc+ec) & (x>=xc-ec) & (y<=yc+lc+R) & (y>=yc-r+R)); % cut.

% Verify 
% surf(x,y,u);