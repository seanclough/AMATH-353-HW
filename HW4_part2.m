x = -10:0.1:10;
figure
hold on
xlabel('x')
ylabel('u(x,t)')
legend_titles = {};
for c = [1 -0.5]
    for t = [0 1 2]
        plot(x,c*exp(-abs(x-c*t)))
        legend_titles{end+1}=strcat('c = ', string(c),', t = ', string(t));
    end
end
legend(legend_titles,'Location','northwest');