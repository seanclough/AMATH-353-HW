x = -5:0.05:8;
t = [0 1 2 3 4];
hold on
figure(1)
for i = t
    plot(x, u(x,i,0.8,0.7))
end
xlabel('x')
ylabel('u(x,t)')
legend_input = cell([1,length(t)]);
for i = 1:length(t)
    legend_input{1,i} = 't = ' + string(t(i));
end
legend(legend_input)

%%
x = -2:0.1:12;
t = 0:0.1:10;
u_matrix = zeros(length(x),length(t));
for i = 1:length(t)
    u_matrix(:,i) = u(x,t(i),0.8,0.7);
end
figure(2)
surf(t,x,u_matrix)
xlabel('x')
ylabel('t')
zlabel('u(x,t)')

function result = u(x_, t_, omega, c_)
    top = 4*atan(sqrt(1-omega^2)*sin(omega*(t_-c_*x_)/sqrt(1-c_^2)));
    bottom = omega*cosh(sqrt(1-omega^2)*(x_-c_*t_)/sqrt(1-c_^2));
    result = top./bottom;
end