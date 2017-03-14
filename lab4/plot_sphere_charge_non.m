function [ ] = plot_sphere_charge_non()
  epsilon = 8.854e-12;
  a = 0.5;
  N = 300;
  y1 = -3;
  y2 = 3;
  dphi = 2*pi/N;
  rho_s = zeros(N+1, N+1);
  theta = linspace(0, pi, N + 1);
  phi = linspace(dphi, 2*pi, N);
  
  for v = 1:length(phi)
      for u = 1:length(theta)
          rho_s(u, v) = sin(theta(u));
      end
  end
  
  y = linspace(y1, y2, 100);

  Etot = zeros(1, length(y));
  V = zeros(1, length(y));


  for k = 1:length(y)
    [Etot(k), V(k)] = sphere_of_charge_non(a, rho_s, 0, y(k), 0, N);
  end


  figure;
  hold on;
  plot(y, Etot, 'ro');
  legend('Calculated');
  xlabel('y(m)');
  ylabel('E(m/C)');

  figure;
  hold on;
  plot(y, V, 'ro');
  legend('Calculated');
  xlabel('y(m)');
  ylabel('V(Volt)');
end
