close all
%%{
figure(1)
x = -pi:0.01:pi;
hold on
for a = [1 5 10 20 100]
    plot(x,q1(x,a))
end
plot(x,abs(x))
legend('1','5','10','20','100','f(x)','Location','SouthEast')

figure(2)
x = -1:0.01:1;
hold on
for a = [1 5 10 20 100]
    plot(x,q2(x,a))
end
plot(x,x>=0)
legend('1','5','10','20','100','f(x)','Location','SouthEast')

figure(3)
x = 0:0.01:1;
hold on
for a = [1 5 10 20 100]
    plot(x,q3(x,a))
end
plot(x,-x+1)
legend('1','5','10','20','100','f(x)')

figure(4)
x = 0:0.01:1;
hold on
for a = [1 5 10 20 100]
    plot(x,q4(x,a))
end
plot(x,-x+1)
legend('1','5','10','20','100','f(x)')
%}

tiledlayout(2,3)
x = 0:0.01:2*pi;
a = 251;
for t = [0.1 0.2 0.3]
    nexttile
    plot(x,q_pain(x,t,a))
    xlabel('x')
    ylabel('u(x,t)')
    title(append('u(x,t) at t=',string(t)))
end
for t = [pi/30 pi/15 pi/10]
    nexttile
    plot(x,q_pain(x,t,a))
    xlabel('x')
    ylabel('u(x,t)')
    title(append('u(x,t) at t=',string(t)))
end

function res = q1(x, a)
    res = pi/2;
    for n=1:a
        res = res - 4/(pi*(2*n-1)^2)*cos((2*n-1)*x);
    end
end

function res = q2(x, a)
    res = 1/2;
    for n=1:a
        res = res + ((-1)^(n+1)+1)/(pi*n)*sin(n*pi*x);
    end
end

function res = q3(x, a)
    res = 0;
    for n=1:a
        res = res + 2/(pi*n)*sin(n*pi*x);
    end
end

function res = q4(x, a)
    res = 1/2;
    for n=1:a
        res = res + (2*((-1)^(n+1)+1))/(pi^2*n^2)*cos(n*pi*x);
    end
end

function res = q_pain(x,t,a)
    res = 1/2;
    for n=0:a
        res = res - 2/pi*(sin((2*n+1)*x-(2*n+1)^3*t))/(2*n+1);
    end
end