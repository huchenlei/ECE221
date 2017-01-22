x = [-1:0.05:1];
y = [-2:0.05:2];
% 3d plot
[X,Y]=meshgrid(x,y);
fxy = 1./(1+(X.^2+Y.^2).^0.5);
figure;
mesh(X,Y,fxy);
xlabel('x axis');
ylabel('y axis');
zlabel('f_{xy}');

% 2d plot at y = -2, 0, 1.6
figure;
hold all;
col_nums = zeros(1, 3);
y_values = [-2, 0, 1.6];
legend_info = cell(1, 3);
for i = 1:3
   col_nums(i) = find(y == y_values(i));
   plot(x, fxy(col_nums(i),:));
   legend_info{i} = ['y=' num2str(y_values(i))];
end
xlabel('x axis');
ylabel('f{xy}');
legend(legend_info);
grid on;
