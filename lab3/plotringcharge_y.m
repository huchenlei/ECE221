function [ ] = plotringcharge_y()
%     epsilon = 8.854e-12;
    a = 0.5;
    q = 3e-3;
    N = 500;
    y1 = 0.1;
    y2 = 2;
    rho_l = q / (2*pi*a);
    y = linspace(y1, y2, 200);
    
%     sEtot = (a * rho_l / (2 * epsilon)) .* abs(z) ./(z.^2 + a^2).^(3/2);
    
    Etot = zeros(1, length(y));
    Ex = zeros(1, length(y));    
    Ey = zeros(1, length(y));    
    Ez = zeros(1, length(y));    
    for k = 1:length(y)
        [Etot(k), Ex(k), Ey(k), Ez(k)] = ringofcharge(a, rho_l, 0, y(k), 0, N);
    end
    
    figure;
    hold on;    
    grid on;
    plot(y, Ex, 'b--');
    plot(y, Ey);
    plot(y, Ez, 'r:');
    legend('Ex', 'Ey', 'Ez');
    xlabel('y(m)');
    ylabel('E(m/C)');
end

