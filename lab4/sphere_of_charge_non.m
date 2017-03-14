 function [ Etot, V, Ex, Ey, Ez ] = sphere_of_charge_non( a, rho_s, x, y, z, N )
    epsilon = 8.854e-12;
    dtheta = pi/N;
    dphi = 2*pi/N;

    theta = linspace(0, pi, N + 1);
    phi = linspace(dphi, 2*pi, N);

    dEx_u = zeros(1, length(theta));
    dEy_u = zeros(1, length(theta));
    dEz_u = zeros(1, length(theta));

    dV_u = zeros(1, length(theta));

    dEx_v = zeros(1, length(phi));
    dEy_v = zeros(1, length(phi));
    dEz_v = zeros(1, length(phi));

    dV_v = zeros(1, length(phi));

    for v = 1: length(phi)
      for u = 1: length(theta)
        x_r = a*sin(theta(u))*cos(phi(v));
        y_r = a*sin(theta(u))*sin(phi(v));
        z_r = a*cos(theta(u));
        R = ((x-x_r)^2 + (y-y_r)^2 + (z-z_r)^2)^(0.5);

        common_factor = (a^2)*sin(theta(u))*rho_s(u, v)*dtheta*dphi/(4*pi*epsilon*R^3);
        dEx_u(u) = common_factor*(x-x_r);
        dEy_u(u) = common_factor*(y-y_r);
        dEz_u(u) = common_factor*(z-z_r);

        dV_u(u) = (a^2)*sin(theta(u))*rho_s(u, v)*dtheta*dphi/(4*pi*epsilon*R);
      end
      dEx_v(v) = sum(dEx_u);
      dEy_v(v) = sum(dEy_u);
      dEz_v(v) = sum(dEz_u);

      dV_v(v) = sum(dV_u);
    end

    Ex = sum(dEx_v);
    Ey = sum(dEy_v);
    Ez = sum(dEz_v);

    V = sum(dV_v);

    Etot = (Ex ^ 2 + Ey ^ 2 + Ez ^ 2) ^ (0.5);
end
