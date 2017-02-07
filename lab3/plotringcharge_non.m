function [ ] = plotringcharge_non()
    epsilon = 8.854e-12;
    a = 0.5;
    
    N = 500;
    z1 = 3;
    z2 = -3;
    theta = linspace(0, 2*pi, N + 1);
    rho_l = 3e-3.*sin(theta);
    
    z = linspace(z1, z2, 201);
    
    Etot = zeros(1, length(z));
    for k = 1:length(z)
        [Etot(k), Ex(k), Ey(k), Ez(k)] = ringofcharge_non(a, rho_l, 0, 0, z(k), N);
%         Etot(k) = (z(k)/abs(z(k))) * Etot(k);
    end
    
    figure;
    hold on;
    grid on;    
    plot(z, Ex, 'r--');
    plot(z, Ey);
    plot(z, Ez, 'b:');
    legend('Ex', 'Ey', 'Ez');
    xlabel('z(m)');
    ylabel('E(m/C)');
%     axis([-3, 3, 0, 1e9]);
end

