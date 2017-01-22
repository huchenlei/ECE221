function [ y ] = my_polynomial( x, params )
%MY_POLYNOMIAL Summary of this function goes here
%   Detailed explanation goes here
figure;
hold all;
grid on;
xlabel('x');
ylabel('y');

y_values = zeros(length(params), length(x));
line_styles = {'-', '--', '-.', ':'};
legend_info = cell(1, length(params) + 1);
for i = 1:length(params)
    y_values(i, :) = params(i) * x.^(i - 1);
    line_style = line_styles{mod(i, 4) + 1};
    plot(x, y_values(i, :), 'linestyle', line_style, 'color', 'b');
    legend_info{i} = ['Term ' num2str(i)];
end
y = sum(y_values);
plot(x, y, 'r-');

legend_info{length(params) + 1} = 'y(x)';
legend(legend_info);
end


