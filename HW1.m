close all
x = -2:0.05:6;
y_1 = 2*sech(x-1).^2;
hold on
plot(x,y_1)
t = 0.5;
y_2 = 2*sech(x-4*t);
plot(x,y_2)
y_3 = x;
for i = 1:length(x)
    temp = 0;
    for j = 1:11
        temp = temp + exp(-j*pi)/(1+exp(-2*j*pi))*cos(0.5*j*pi*x(i));
    end
    y_3(i) = pi/4 + pi*temp;
end
plot(x,y_3)