 function [ Etot, Ex, Ey, Ez ] = ringofcharge( a, rho_l, x, y, z, N )
    epsilon = 8.854e-12;
    dt = 2*pi/N;
    tprime = linspace(0, 2*pi, N + 1);

    dEx = zeros(1, length(tprime));
    dEy = zeros(1, length(tprime));
    dEz = zeros(1, length(tprime));

    for k=1:N
        delta_x = x - a * cos(tprime(k));
        delta_y = y - a * sin(tprime(k));
        integrand = a * dt/((delta_x^2 + delta_y^2 + z^2)^(3/2));
        dEx(k) = integrand * delta_x;
        dEy(k) = integrand * delta_y;
        dEz(k) = integrand * z;
    end

    factor = (rho_l/(4 * pi * epsilon));
    Ex = factor * sum(dEx);
    Ey = factor * sum(dEy);
    Ez = factor * sum(dEz);
    Etot = (Ex ^ 2 + Ey ^ 2 + Ez ^ 2) ^ (1/2);

    %verify result
%     func_x = @(tprime) (x - a .* cos(tprime)).* a./(((x - a .* cos(tprime)).^2 + (y - sin(tprime)).^2 + z.^2).^(3/2));
%     func_y = @(tprime) (y - a .* sin(tprime)).* a./(((x - a .* cos(tprime)).^2 + (y - sin(tprime)).^2 + z.^2).^(3/2));
%     func_z = @(tprime) z .* a./(((x - a .* cos(tprime)).^2 + (y - a .* sin(tprime)).^2 + z.^2).^(3/2));
%     sEx = factor * integral(func_x, 0, 2*pi);
%     sEy = factor * integral(func_y, 0, 2*pi);
%     sEz = factor * integral(func_z, 0, 2*pi);
%     sEtot = (sEx^2 + sEy^2 + sEz^2)^(1/2);
%     fprintf('theoretic x: %d\n', sEx);
%     fprintf('theoretic y: %d\n', sEy);
%     fprintf('theoretic z: %d\n', sEz);
%     fprintf('theoretic mag: %d\n', sEtot);
%     fprintf('difference: %d\n', (sEtot - Etot)/sEtot);
end
