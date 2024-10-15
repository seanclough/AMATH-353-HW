roughness = 0.1;
x = -20:roughness:20;
t = 0:roughness:25;
u_matrix = zeros(length(x), length(t));
for i = 1:length(t)
    for j = 1:length(x)
        u_matrix(j,i)=u(x(j),t(i));
    end
end
%%{
figure(1)
surf(t,x,u_matrix)
xlabel('t')
ylabel('x')
zlabel('u(x,t)')
%}
figure(2)
hold on
plot(x,u_matrix(:,1))
wanted_t = 10;
plot(x,u_matrix(:,int32(wanted_t/roughness+1)))
wanted_t = 12;
plot(x,u_matrix(:,int32(wanted_t/roughness+1)))
wanted_t = 15;
plot(x,u_matrix(:,int32(wanted_t/roughness+1)))
wanted_t = 22;
plot(x,u_matrix(:,int32(wanted_t/roughness+1)))
xlabel('x')
ylabel('g(x,t)')
legend('t=0','t=10','t=12','t=15','t=22')
figure(3)
hold off
M(length(t)) = struct('cdata',[],'colormap',[]);
for i=1:length(t)
    plot(x,u_matrix(:,i))
    ylim([0,1])
    xlim([-20,20])
    M(i) = getframe;
end
movie(M)

function result = p_1(t)
    result = (exp(-2*t)+4*exp(-t-13))/(2*(exp(-2*t)+2*exp(-t-13)));
end

function result = p_2(t)
    result = (exp(-2*t)+exp(-t-13))/(exp(-2*t)+2*exp(-t-13));
end

function result = x_1(t)
    result = 1/2*log((2*exp(-3*t-13))/(exp(-2*t)+4*exp(-t-13)));    
end

function result = x_2(t)
    result = 1/2*log(2*(exp(-2*t)+exp(-t-13)));    
end

function result = u(x,t)
    result = p_1(t)*exp(-2*abs(x-x_1(t)))+p_2(t)*exp(-2*abs(x-x_2(t)));
end