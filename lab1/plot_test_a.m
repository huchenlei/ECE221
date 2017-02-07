t = linspace(0, 10, 100);
v1 = exp(-0.5.*t).*sin(4.*t);
v2 = exp(-0.25.*t).*cos(4.*t);

figure
plot(t, v1);
hold
plot(t, v2);

grid on
title('Two Decaying Sinusoids')
legend('v1', 'v2')
xlabel('Time (s)')
ylabel('Voltage (V)')

figure
subplot(2, 1, 1);
plot(t, v1);
title('first Decaying Sinusoids')
legend('v1')
xlabel('Time (s)')
ylabel('Voltage (V)')
hold
subplot(2, 1, 2);
plot(t, v2);
title('second Decaying Sinusoids')
legend('v2')
xlabel('Time (s)')
ylabel('Voltage (V)')