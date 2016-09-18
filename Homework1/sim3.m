function sim3(eq, x0a, x0b, x0c, tsp)
[t1,x1] = ode23(@(t1,x1) eq, tsp, x0a)
[t2,x2] = ode23(@(t2,x2) eq, tsp, x0b)
[t3,x3] = ode23(@(t3,x3) eq, tsp, x0c)
plot(t1,x1,'-o')
hold on
plot(t2,x2,':d')
plot(t3,x3,'s')
title(p, ['xdot = ' eq])
xlabel(p, 't')
ylabel(p, 'x')
title(legend(x0a, x0b, x0c), 'x0')
hold off
end