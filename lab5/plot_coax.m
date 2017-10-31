%   a = 2.2e-3;
%   b = 2e-3;
%   c = 1e-3;
%   d = 0.8e-3;
%   xo = 0.6e-3;
%   yo = 0.6e-3;
%   er = 1;
%   Vo = 3;
  
%   a = 4e-3;
%   b = 4e-3;
%   c = 2e-3;
%   d = 2e-3;
%   xo = 1e-3;
%   yo = 1e-3;
%   er = 1;
%   Vo = 3;
  
%   a = 1;
%   b = 0.5;
%   c = 0.2;
%   d = 0.1;
%   xo = 0.2;
%   yo = 0.2;
%   er = 2;
%   Vo = 3;

%   a = 20e-3;
%   b = 15e-3;
%   c = 4e-3;
%   d = 4e-3;
%   xo = 7e-3;
%   yo = 5e-3;
%   er = 6;
%   Vo = 4;

%   a = 2e-2;
%   b = 2e-2;
%   c = 1.95e-2;
%   d = 0.128e-2;
%   xo = 0.025e-2;
%   yo = 0.936e-2;
%   er = 2.5;
%   Vo = 10;

  a = 2e-2;
  b = 2e-2;
  c = 0.5e-2;
  d = 0.5e-2;
  xo = 0.75e-2;
  yo = 0.5e-2;
  er = 2.5;
  Vo = 10;
[V,Ex,Ey,C,We,We2,gridpointsx,gridpointsy,innerx,innery,outerx,outery] = bvprectangularcoax(a,b,c,d,xo,yo,er,Vo);
