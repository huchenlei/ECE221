function [ ] = plotringcharge()
    epsilon = 8.854e-12;
    a = 0.5;
    q = 3e-3;
    N = 500;
    z1 = 3;
    z2 = -3;
    rho_l = q / (2*pi*a);
    z = linspace(z1, z2, 200);

    sEtot = (a * rho_l / (2 * epsilon)) .* z ./(z.^2 + a^2).^(3/2);

    Etot = zeros(1, length(z));
    for k = 1:length(z)
        Etot(k) = ringofcharge(a, rho_l, 0, 0, z(k), N);
        Etot(k) = (z(k)/abs(z(k))) * Etot(k);
    end

    figure;
    hold on;
    plot(z, sEtot, 'b');
    plot(z, Etot, 'ro');
    legend('Theory', 'Calculated');
    xlabel('z(m)');
    ylabel('E(m/C)');
end
