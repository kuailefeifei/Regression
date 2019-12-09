%% Generation of input and output data
clc
clear all
x = randperm(100,80)/50;
error = (rand(1,80)-0.5)*4;
y = zeros(1,numel(x));
for i = 1:numel(x)
    y(i) = 3*x(i) + 4*(x(i).^2) + 5*(x(i).^3) + 8;
end
y = y - error;
plot(x,y,'c*')
hold on

%% regression
para = regression(x,y,3);
x_plot = round(min(x)):0.01:round(max(x));
y_plot = 0;

for i = 1:numel(para) - 1 
    y_plot = y_plot + para(i)*(x_plot.^i);
end

y_plot = y_plot + para(numel(para));

plot(x_plot,y_plot)