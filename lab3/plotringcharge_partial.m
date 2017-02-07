function [ ] = plotringcharge_partial()
%     epsilon = 8.854e-12;
    a = 0.5;
    N = 500;
    y1 = 0.1;
    y2 = 2;
    rho_l = 2e-3;
    z = linspace(y1, y2, 200);
    
%     sEtot = (a * rho_l / (2 * epsilon)) .* abs(z) ./(z.^2 + a^2).^(3/2);
    
    Etot = zeros(1, length(z));
    Ex = zeros(1, length(z));    
    Ey = zeros(1, length(z));    
    Ez = zeros(1, length(z));    
    for k = 1:length(z)
        [Etot(k), Ex(k), Ey(k), Ez(k)] = ringofcharge_partial(a, rho_l, 0.75, 0.75, z(k), N);
    end
    
    figure;
    hold on;    
    grid on;
    plot(z, Ex, 'b--');
    plot(z, Ey, 'c-');
    plot(z, Ez, 'r:');
    legend('Ex', 'Ey', 'Ez');
    xlabel('z(m)');
    ylabel('E(m/C)');
end

