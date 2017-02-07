function [ sum ] = my_intergral( x1, x2 )
accuracy = 10000;
x = linspace(x1, x2, accuracy);
y = sin(x).^3;

sum = 0;
for i = 1:length(x)
    sum = sum + y(i) * (x2 - x1)/accuracy;
end
fprintf('calculated value: %d\n', sum);

fun = @(x) exp(-x.^2);
q = integral(fun, x1, x2);
fprintf('standard value: %d\n', q);
fprintf('accuracy is: %d\n', abs((q-sum)/q));
end