function [ ] = plot_sphere_charge()
  epsilon = 8.854e-12;
  a = 0.5;
  N = 300;
  y1 = -3;
  y2 = 3;
  rho_s = 2e-6;

  y = linspace(y1, y2, 100);

  Etot = zeros(1, length(y));
  V = zeros(1, length(y));

  sEtot = (rho_s*a^2)./(epsilon.*(y.^2));
  for i = 1:length(y)
      if abs(y(i)) < a
          sEtot(i) = 0;
      end
  end
  sV = zeros(1, length(y));
  for i = 1:length(y)
      if abs(y(i)) < a
          sV(i) = rho_s * a / epsilon;
      else
          sV(i) = rho_s * a^2 / (epsilon * abs(y(i)));
      end
  end

  for k = 1:length(y)
    [Etot(k), V(k)] = sphere_of_charge(a, rho_s, 0, y(k), 0, N);
  end


  figure;
  hold on;
  plot(y, sEtot, 'b-');
  plot(y, Etot, 'ro');
  legend('Theory', 'Calculated');
  xlabel('y(m)');
  ylabel('E(m/C)');

  figure;
  hold on;
  plot(y, sV, 'b-');
  plot(y, V, 'ro');
  legend('Theory', 'Calculated');
  xlabel('y(m)');
  ylabel('V(Volt)');
end
