%% Generation of input and output data
close all
clc
clear all
x = randperm(100,80)/25;
error = (rand(1,80)-0.5)*4;
y = zeros(1,numel(x));
para_true = [3; 4; -5; 0.5; 8];
for i = 1:numel(x)
    y(i) = para_true(1)*x(i) + para_true(2)*(x(i).^2) + para_true(3)*(x(i).^3) + para_true(4)*(x(i).^4) + para_true(5);
end
y = y - error;
plot(x,y,'c*')
hold on

%% regression
para = regression(x,y,4);
x_plot = round(min(x))-1:0.01:round(max(x))+1;
y_plot = 0;

for i = 1:numel(para) - 1 
    y_plot = y_plot + para(i)*(x_plot.^i);
end

y_plot = y_plot + para(numel(para));

plot(x_plot,y_plot)

%% evaluation
para_name = ["first_para";"second_para";"third_para";"fourth_para";"constant"];
true_value = para_true;
pred_value = para;
T = table(para_name,true_value,pred_value)