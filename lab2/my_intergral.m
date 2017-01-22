function [ sum ] = my_intergral( x1, x2 )
x = linspace(x1, x2, 10000);
y = exp(-x.^2);

sum = 0;
for i = 1:length(x)
    sum = sum + y(i) * (x2 - x1)/10000;
end
fprintf('calculated value: %d\n', sum);

% fun = @(x) exp(-x.^2);
% q = integral(fun, x1, x2);
% fprintf('standard value: %d\n', q);

end

