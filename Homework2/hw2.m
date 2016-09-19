%% Homework 2
%
% Rachael Steiner
%
% Due Sept. 19, 2016
%%
% For each of the following equations, sketch all of the qualitatively different vector fields
% (i.e., phase portraits) that occur as r is varied, and the bifurcation diagram. State what
% kind of bifurcation occurs, and the critical value of r at which it occurs. Finally, simulate
% one of them for values of r at, above, and below the critical value; plot x vs. t for 2 initial
% conditions for each r value, and comment on the results.
%% xdot = rx - x(1-x)
% 
% A saddle-node bifurcation occurs at r = 1.

% for r = 0

r1 = 0;
r2 = 1;
r3 = 2;
x = -4:0.01:4;
y = @(x, r) (x.*r) - x.*(1-x);
y1 = feval(y, x, r1);
y2 = feval(y, x, r2);
y3 = feval(y, x, r3);
plot(x, y1);
title('xdot = rx - x(1-x)');
xlabel('x');
ylabel('xdot');
% ax = gca;
% ax.Position = [0 0 1 1];
% xlim([-4 4]);
% ylim([-4 4]);
axis([-4 4 -4 4]);

hold on
plot(x, y2)
plot(x, y3)
plot(x,zeros(1,length(x)), 'k');
plot(zeros(1,length(x)), x, 'k');

title(legend(num2str(r1), num2str(r2), num2str(r3)), 'r');

hold off








