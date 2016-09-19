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
% A transcritical bifurcation occurs at r = 1.

r1 = 0;
r2 = 1;
r3 = 2;
x = -4:0.01:4;
y = @(x, r) (x.*r) - x.*(1-x);
y1 = feval(y, x, r1);
y2 = feval(y, x, r2);
y3 = feval(y, x, r3);
figure(1)
plot(x, y1);
title('xdot = rx - x(1-x)');
xlabel('x');
ylabel('xdot');
axis([-3 3 -1 4]);

hold on
plot(x, y2)
plot(x, y3)
plot(x,zeros(1,length(x)), 'k');
plot(zeros(1,length(x)), x, 'k');

title(legend(num2str(r1), num2str(r2), num2str(r3)), 'r');

hold off

%%% Bifurcation diagram

r = -4:0.01:4;
xstar = @(r) 1 - r;
figure(2)
plot(r, feval(xstar, r));
title('Bifurcation diagram for xdot = rx - x(1-x)');
xlabel('r');
ylabel('x');
axis([-4 4 -4 4]);
hold on
plot(r,zeros(1,length(r)), 'k');
plot(zeros(1,length(r)), r, 'k');
hold off

%% xdot = x - rx(1-x)
%
% A transcritical bifurcation occurs at r = 1

r0 = -1;
r1 = 0.5;
r2 = 1;
r3 = 2;
x = -4:0.01:4;
y = @(x, r) x - r.*x.*(1-x);
% y0 = feval(y, x, r0);
y1 = feval(y, x, r1);
y2 = feval(y, x, r2);
y3 = feval(y, x, r3);
figure(1)
plot(x, y1);
title('xdot = x - rx(1-x)');
xlabel('x');
ylabel('xdot');
axis([-4 4 -1 4]);

hold on
% plot(x, y0)
plot(x, y2)
plot(x, y3)
plot(x,zeros(1,length(x)), 'k');
plot(zeros(1,length(x)), x, 'k');

title(legend(num2str(r0), num2str(r1), num2str(r2), num2str(r3)), 'r');

hold off

%%% Bifurcation diagram

r = -4:0.01:4;
xstar = @(r) (r - 1)./r;
figure(2)
plot(r, feval(xstar, r));
title('Bifurcation diagram for xdot = x - rx(1-x)');
xlabel('r');
ylabel('x');
axis([-4 4 -4 4]);
hold on
plot(r,zeros(1,length(r)), 'k');
plot(zeros(1,length(r)), r, 'k');
hold off

%% xdot = x - rx^3
%
% A supercritical pitchfork bifurcation occurs at r = 1.

r1 = 0.5;
r2 = 1;
r3 = 2;
x = -4:0.01:4;
y = @(x, r) x - (x.^3).*r;
y1 = feval(y, x, r1);
y2 = feval(y, x, r2);
y3 = feval(y, x, r3);
subplot(2,2,1)
plot(x, y1);
hold on
plot(x,zeros(1,length(x)), 'k');
plot(zeros(1,length(x)), x, 'k');
title('xdot = x - 0.5x^3');
xlabel('x');
ylabel('xdot');
axis([-3 3 -1 4]);
hold off

% hold on
subplot(2,2,2)
plot(x, y2)
hold on
plot(x,zeros(1,length(x)), 'k');
plot(zeros(1,length(x)), x, 'k');
title('xdot = x - x^3');
xlabel('x');
ylabel('xdot');
axis([-3 3 -1 4]);
hold off

subplot(2,2,3)
plot(x, y3)
hold on
plot(x,zeros(1,length(x)), 'k');
plot(zeros(1,length(x)), x, 'k');
title('xdot = x - 2x^3');
xlabel('x');
ylabel('xdot');
axis([-3 3 -1 4]);
hold off

% title(legend(num2str(r1), num2str(r2), num2str(r3)), 'r');

% hold off

%%% Bifurcation diagram

r = -4:0.01:4;
xstar = @(r) (-(r.^0.5))./r;
figure(2)
plot(r, feval(xstar, r));
title('Bifurcation diagram for xdot = xdot = x - 2x^3');
xlabel('r');
ylabel('x');
axis([-4 4 -4 4]);
hold on
plot(r,zeros(1,length(r)), 'k');
plot(zeros(1,length(r)), r, 'k');
hold off






