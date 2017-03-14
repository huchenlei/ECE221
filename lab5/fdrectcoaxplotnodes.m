function[gridpointsx,gridpointsy,innerx,innery,outerx,outery]=fdrectcoaxplotnodes(a,b,c,d,xo,yo,Nx,Ny)
%
% [gridpointsx,gridpointsy,innerx,innery,outerx,outery]=fdrectcoaxplotnodes(a,b,c,d,xo,yo,Nx,Ny)
% This function creates a plot of the grid of nodes for the finite difference
% method solution for the potential within a rectangular coaxial cable.
%
% Determine the node spacing in the x and y directions
hx=a/(Nx-1);
hy=b/(Ny-1);
% Determine indexes that represent the inner conductor
% These are rounded to ensure that they are integers
innerstartx=round(xo/hx+1);
innerendx=round(innerstartx+c/hx);
innerstarty=round(yo/hy+1);
innerendy=round(innerstarty+d/hy);
% Plot the grid points and known voltage nodes
% gridpointsx is a matrix (size Nx x Ny) that contains the x-values of the
% locations of the nodes within the grid.
% gridpointsy is a matrix (size Nx x Ny) that contains the y-values of the
% locations of the nodes within the grid.
[gridpointsx,gridpointsy]=meshgrid(0:hx:a,0:hy:b);
% innerx and innery are matrices that contains the x- and y-values of the
% locations of the nodes that relate to the inner conductor.
[innerx,innery]=meshgrid((innerstartx-1)*hx:hx:(innerendx-1)*hx,(innerstarty-1)*hy:hy:(innerendy-1)*hy);
% outerx and outery are matrices that contains the x- and y-values of the
% locations of the nodes that relate to the outer conductor.
outerx=[0:hx:a,zeros(1,Ny-2),a:-hx:0,zeros(1,Ny-2)];
outerx((Nx+1):(Nx+Ny-2))=a;
outery=[zeros(1,Nx),hy:hy:(b-hy),zeros(1,Nx),(b-hy):-hy:hy];
outery((Nx+Ny-1):(2*Nx+Ny-2))=b;
figure
plot(gridpointsx,gridpointsy,'b*');hold;
plot(outerx,outery,'kd');
plot(innerx,innery,'ro');
end