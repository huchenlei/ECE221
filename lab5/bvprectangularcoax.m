function [V,Ex,Ey,C,We,We2,gridpointsx,gridpointsy,innerx,innery,outerx,outery] = bvprectangularcoax(a,b,c,d,xo,yo,er,Vo)
      %
      % This function used the finite difference method to solve the
      % two-dimensional electrostatic boundary value problem related to a square
      % coaxial cable.
      % a = width of outer conductor
      % b = height of outer conductor
      % c = width of inner conductor
      % d = height of inner conductor
% xo = the x-coordinate of the location of the bottom left corner of the inner conductor
% yo = the y-coordinate of the location of the bottom left corner of the inner conductor
% er = the relative permittivity of the dielectric which fills the space
% between the inner and outer conductor
% Vo = electric potential of the inner conductor (outer is grounded)

% Define the fundamental constant eo
  eo=8.854e-12;
% Define tolerance to exit loop
  tolerance = 1e-4;
  % Set number of nodes and node spacings
  Nx=201;
  hx=a/(Nx-1);
  hy=hx;
  Ny=round(b/hy+1);
%   Ny=round(b/hy);

  % the initial values of V to zero
  V = zeros(Nx,Ny);

  % Set the known potential values (or boundary values)
  V(1,1:Ny)=0; % Grounded left side
  V(1:Nx,1)=0; % Grounded bottom side
  V(Nx,1:Ny)=0; % Grounded right side
  V(1:Nx,Ny)=0; % Grounded top side

  innerstartx=round(xo/hx+1);
  innerendx=round(innerstartx+c/hx);
  innerstarty=round(yo/hy+1);
  innerendy=round(innerstarty+d/hy);
  V(innerstartx:innerendx,innerstarty:innerendy)=Vo; % Set potentials of inner conductor

  maxdev = tolerance + 1; % initial maxdev to begin loop
  while (maxdev > tolerance)
    Vold = V(2:Nx-1, 2:Ny-1);
    for x = 2 : Nx - 1
      for y = 2 : Ny - 1
         if (x < innerstartx || x > innerendx) || (y < innerstarty || y > innerendy)
%        if (x <= innerstartx || x >= innerendx) || (y <= innerstarty || y >= innerendy)
          V(x, y) = (1/4)*(V(x+1, y) + V(x-1, y) + V(x, y+1) + V(x, y-1));
        end
      end
    end
    Vnew = V(2:Nx-1, 2:Ny-1);
    maxdev = max(max(abs(100*(Vnew - Vold) ./ (Vnew))));
    %fprintf('maxdev is %d\n', maxdev);  
  end
  [Ey, Ex] = gradient(-V, hx, hy);
  
  offsetx = 0;
  offsety = 0;

  innerstartx = innerstartx - offsetx;
  innerendx = innerendx + offsetx;
  innerstarty = innerstarty - offsety;
  innerendy = innerendy + offsety;
  
  Qinner = 0;
  for x = innerstartx : innerendx
      for y = innerstarty : innerendy
%           if (x == innerstartx || x == innerendx) || (y == innerstarty || y == innerendy)
%               Qinner = Qinner + (Ex(x,y) ^ 2 + Ey(x,y) ^ 2)^(1/2) * eo * er * hy;            
%           end
%           if (x == innerstartx || x == innerendx) && (y == innerstarty || y == innerendy)
%               Qinner = Qinner + ((V(x-1, y) - V(x+1, y))^2 + (V(x, y-1) - V(x, y+1))^2)^(1/2) *eo *er;
          if (x == innerstartx && y == innerstarty) 
              Qinner = Qinner + abs(V(x, y) - V(x-1, y-1)) * eo * er;
          elseif (x == innerstartx && y == innerendy) 
              Qinner = Qinner + abs(V(x, y) - V(x-1, y+1)) * eo * er;
          elseif (x == innerendx && y == innerstarty) 
              Qinner = Qinner + abs(V(x, y) - V(x+1, y-1)) * eo * er;          
          elseif (x == innerendx && y == innerendy) 
              Qinner = Qinner + abs(V(x, y) - V(x+1, y+1)) * eo * er;
          elseif (x == innerstartx)
             Qinner = Qinner + abs(V(x, y) - V(x-1, y)) * eo * er;
          elseif(y == innerstarty)
             Qinner = Qinner + abs(V(x, y) - V(x, y-1)) * eo * er; 
          elseif (x == innerendx)
             Qinner = Qinner + abs(V(x, y) - V(x+1, y)) * eo * er;
          elseif(y == innerendy)
             Qinner = Qinner + abs(V(x, y) - V(x, y+1)) * eo * er; 
          end
      end
  end
  
  We2 = 0;
  for x = 1 : Nx
      for y = 1 : Ny
          We2 = We2 + eo * er * (Ex(x, y)^2 + Ey(x, y)^2) * hx ^ 2;
      end
  end
  
  C = Qinner / Vo; 
  We = (1/2)* C * (Vo^2);
  We2 = (1/2) * We2; 
  [gridpointsx,gridpointsy,innerx,innery,outerx,outery]=fdrectcoaxplotnodes(a,b,c,d,xo,yo,Nx,Ny);

  figure;
  meshc(gridpointsx,gridpointsy,V');
  
  figure;
  contourf(gridpointsx,gridpointsy,V');
  
  figure;
  quiver(gridpointsx,gridpointsy,Ex',Ey');


end
