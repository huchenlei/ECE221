x = linspace(0, 5, 100);
y = sin(x)./x;

figure
plot(x, y);
grid on
title('Acceleration of car')
xlabel('Time (s)')
ylabel('Acceleration (m/s^2)')
axis([0 5 0 1])
