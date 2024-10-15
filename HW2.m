close all
x=0:0.05:10;
t=[0 0.5 1 2 3 4];
u = zeros(length(t),length(x));
for i=1:length(x)
    for j=1:length(t)
        if x(i)<2*t(j)
            u(j,i)=0.5*(exp(-(x(i)+2*t(j)-5)^2)-exp(-(-x(i)+2*t(j)-5)^2));
        else
            u(j,i)=0.5*(exp(-(x(i)+2*t(j)-5)^2)+exp(-(x(i)-2*t(j)-5)^2));
        end
    end
end

figure(1);
for i = 1:length(t)
    plot(x,u(i,:));
    hold on;
end

xlabel({'$x$'},'Interpreter','latex');
ylabel({'$u(x,t)$'},'Interpreter','latex');
legend({'$t=0$','$t=0.5$','$t=1$','$t=2$','$t=3$','$t=4$'},...
'Interpreter','latex','Location','SouthEast');

hold off
x=0:0.05:10;
t=0:0.05:4;
u = zeros(length(t),length(x));
for i=1:length(x)
    for j=1:length(t)
        if x(i)<2*t(j)
            u(j,i)=0.5*(exp(-(x(i)+2*t(j)-5)^2)-exp(-(-x(i)+2*t(j)-5)^2));
        else
            u(j,i)=0.5*(exp(-(x(i)+2*t(j)-5)^2)+exp(-(x(i)-2*t(j)-5)^2));
        end
    end
end
[X,T] = meshgrid(x,t);
figure(2);
contour(X,T,u,'ShowText','on')
xlabel({'$x$'},'Interpreter','latex')
ylabel({'$t$'},'Interpreter','latex')
title("Contour plot of $u(x,t)$",'Interpreter','latex')