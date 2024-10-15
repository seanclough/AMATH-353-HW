close all
t = 0:0.05:2;
hold on
for x_0 = -10:0.5:10
    plot(x_0*exp(t.^2),t)
end
xlim([-10,10])
xlabel("x")
ylabel("t")
%%
close all
x = -10:0.01:10;
u = zeros(1,length(x));
u_0=20;
u_1=30;
v_1=50;
hold on
for t = 0:1:1
    for i=1:length(x)
        u(i)=ihavetwelveminutesleft(x(i),t,u_0,u_1,v_1);
    end
    plot(x,u)
end
xlim([-10,10])
xlabel("x")
ylabel("u(x,t)")
legend("t=0","t=1")
%%
u=-10:0.1:10;
v_1=50;
u_1=30;
plot(u,v_1*(1-u.^2/u_1^2))
xlabel("u")
ylabel("v")
xlim([0,10])

function res = ihavetwelveminutesleft(x,t,u_0,u_1,v_1)
    res = (-u_0*v_1*(u_1+u_0))/(u_1^2)*t;
    if x < res
        res = u_0;
    else
        res = u_1;
    end
end

function res = iwantsleep(x,t)
    if t>1
        if x>0.5*(t+1)
            res = 0;
        else
            res = 1;
        end
    else
        if x<=t
            res = 1;
        elseif x>=1
            res = 0;
        else
            res = 1-(x-t)./(1-t);
        end
    end
end