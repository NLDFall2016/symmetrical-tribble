%% Homework 1
%
% Due 9/12/16
%
% Rachael Steiner

%% xdot = -3x
% *1) Sketch the 1D flow*
%
% <<..\eq1-edit2.PNG>>
% 
%
% *2) Identify the fixed points and their stabilities, if any.*
%
% x = 0; globally stable
%
% *3) Simulate each, from at least 3 different initial conditions*

tspan = [0 5];
x0 = 1;
[t,x] = ode23(@(t,x) -3*x, tspan, x0);
plot(t, x, '-o')
title('xdot = -3x')
xlabel('t')
ylabel('x')

hold on

x0b = 0.1;
[t,x] = ode23(@(t,x) -3*x, tspan, x0b);
plot(t, x, '-o')

x0c = -0.5;
[t,x] = ode23(@(t,x) -3*x, tspan, x0c);
plot(t, x, '-o')

x0d = 0;
[t,x] = ode23(@(t,x) -3*x, tspan, x0d);
plot(t, x, '-o')

title(legend(num2str(x0), num2str(x0b), num2str(x0c), num2str(x0d)), 'x0')
%
% *Euler Method:*
%
% x0s = [x0 x0b x0c x0d];
% ode1 = @(x) -3*x;
% dxdt_eul = zeros(1,length(x0s));
% 
% for n = 1:length(x0s)
%     dxdt_eul(n) = eul(ode1, 0, 5, 0.1, x0s(n));
%     plot(0:0.1:5, dxdt_eul(n), '--')
% end

ode1 = @(x) -3*x;
dxdt_a = eul(ode1, 0, 5, 0.1, x0);
dxdt_b = eul(ode1, 0, 5, 0.1, x0b);
dxdt_c = eul(ode1, 0, 5, 0.1, x0c);
dxdt_d = eul(ode1, 0, 5, 0.1, x0d);

plot(0:0.1:5, dxdt_a, '--d')
plot(0:0.1:5, dxdt_b, '--d')
plot(0:0.1:5, dxdt_c, '--d')
plot(0:0.1:5, dxdt_d, '--d')

% Improved euler method:

dxdt_a2 = eul2(ode1, 0, 5, 0.1, x0);
dxdt_b2 = eul2(ode1, 0, 5, 0.1, x0b);
dxdt_c2 = eul2(ode1, 0, 5, 0.1, x0c);
dxdt_d2 = eul2(ode1, 0, 5, 0.1, x0d);

plot(0:0.1:5, dxdt_a2, ':*')
plot(0:0.1:5, dxdt_b2, ':*')
plot(0:0.1:5, dxdt_c2, ':*')
plot(0:0.1:5, dxdt_d2, ':*')

hold off

% 4) Qualitative description
%
% Globally stable at x = 0. For x0 > 0, decays to zero quickly. For x0 < 0,
% increases quickly to zero.


%% xdot = 4x^2 - 16
% 
% 1) 
%
% <<..\eq2-edit2.PNG>>
%
% 2) x = -2, locally stable;
% x = 2, unstable
%
% 3)

tspan = [0 0.36];
x0 = 0;
[t,x] = ode23(@(t,x) 4*x^2-16, tspan, x0); %%%%%% you can give it a vector of initial conditions!!
plot(t, x, '-s')
title('xdot = 4*x^2-16')
xlabel('t')
ylabel('x')

hold on

x0b = 2;
[t,x] = ode23(@(t,x) 4*x^2-16, tspan, x0b);
plot(t, x, '-s')

x0c = -3;
[t,x] = ode23(@(t,x) 4*x^2-16, tspan, x0c);
plot(t, x, '-s')

x0d = 2.01;
[t,x] = ode23(@(t,x) 4*x^2-16, tspan, x0d);
plot(t, x, '-s')

x0e = 1;
[t,x] = ode23(@(t,x) 4*x^2-16, tspan, x0e);
plot(t, x, '-s')

title(legend(num2str(x0), num2str(x0b), num2str(x0c), num2str(x0d), num2str(x0e)), 'x0')

% Euler method:

ode2 = @(x) 4*x^2-16;
tmin = 0;
tmax = 0.36;
tstep = 0.01;
dxdt_a = eul(ode2, tmin, tmax, tstep, x0);
dxdt_b = eul(ode2, tmin, tmax, tstep, x0b);
dxdt_c = eul(ode2, tmin, tmax, tstep, x0c);
dxdt_d = eul(ode2, tmin, tmax, tstep, x0d);
dxdt_e = eul(ode2, tmin, tmax, tstep, x0e);

plot(tmin:tstep:tmax, dxdt_a, '--d')
plot(tmin:tstep:tmax, dxdt_b, '--d')
plot(tmin:tstep:tmax, dxdt_c, '--d')
plot(tmin:tstep:tmax, dxdt_d, '--d')
plot(tmin:tstep:tmax, dxdt_e, '--d')

% Improved euler method:

dxdt_a2 = eul2(ode2, tmin, tmax, tstep, x0);
dxdt_b2 = eul2(ode2, tmin, tmax, tstep, x0b);
dxdt_c2 = eul2(ode2, tmin, tmax, tstep, x0c);
dxdt_d2 = eul2(ode2, tmin, tmax, tstep, x0d);
dxdt_e2 = eul2(ode2, tmin, tmax, tstep, x0e);

plot(tmin:tstep:tmax, dxdt_a2, ':*')
plot(tmin:tstep:tmax, dxdt_b2, ':*')
plot(tmin:tstep:tmax, dxdt_c2, ':*')
plot(tmin:tstep:tmax, dxdt_d2, ':*')
plot(tmin:tstep:tmax, dxdt_e2, ':*')

hold off

% 4) Locally stable at x = +/- 2. For x0 < 2, converges on 2. For x0 > 2,
% increases to infinity rapidly.


%% xdot = 1 + 0.5cosx
% 
% 1) 
%
% <<..\eq3-edit2.PNG>>
%
% 2) no fixed points
%
% 3)

tspan = [0 5];
x0 = 0;
x0b = -2;
x0c = 1;
[t,x] = ode23(@(t,x) 1+0.5*cos(x), tspan, [x0 x0b x0c]);
plot(t, x, '-d')
hold on
title('xdot = 1 + 0.5*cos(x)')
xlabel('t')
ylabel('x')

title(legend(num2str(x0), num2str(x0b), num2str(x0c)), 'x0')

% Euler method:

ode3 = @(x) 1+0.5*cos(x);
tmin = 0;
tmax = 5;
tstep = 0.1;
dxdt_a = eul(ode3, tmin, tmax, tstep, x0);
dxdt_b = eul(ode3, tmin, tmax, tstep, x0b);
dxdt_c = eul(ode3, tmin, tmax, tstep, x0c);
% dxdt_d = eul(ode2, tmin, tmax, tstep, x0d);
% dxdt_e = eul(ode2, tmin, tmax, tstep, x0e);

plot(tmin:tstep:tmax, dxdt_a, '--d')
plot(tmin:tstep:tmax, dxdt_b, '--d')
plot(tmin:tstep:tmax, dxdt_c, '--d')
% plot(tmin:tstep:tmax, dxdt_d, '--')
% plot(tmin:tstep:tmax, dxdt_e, '--')

% Improved euler method:

dxdt_a2 = eul2(ode3, tmin, tmax, tstep, x0);
dxdt_b2 = eul2(ode3, tmin, tmax, tstep, x0b);
dxdt_c2 = eul2(ode3, tmin, tmax, tstep, x0c);
% dxdt_d2 = eul2(ode2, tmin, tmax, tstep, x0d);
% dxdt_e2 = eul2(ode2, tmin, tmax, tstep, x0e);

plot(tmin:tstep:tmax, dxdt_a2, ':*')
plot(tmin:tstep:tmax, dxdt_b2, ':*')
plot(tmin:tstep:tmax, dxdt_c2, ':*')
% plot(tmin:tstep:tmax, dxdt_d2, ':')
% plot(tmin:tstep:tmax, dxdt_e2, ':')

hold off

% 4) Globally unstable. Increases for all x0.

%% xdot = 1 - x^14
% 
% 1) 
%
% <<..\eq4-edit.PNG>>
%
% 2) x = -1, unstable;
% x = 1, locally stable
%
% 3)

tspan = [0 .25];
x0 = 0;
x0b = -1;
x0c = 1;
x0d = 1.5;
% x0e = -1.1;
[t,x] = ode23(@(t,x) 1 - x.^14, tspan, [x0 x0b x0c x0d]);
plot(t, x, '-o')
title('xdot = 1 - x^ 14')
xlabel('t')
ylabel('x')

hold on

% x0b = -1;
% [t,x] = ode23(@(t,x) 1 - x^14, tspan, x0b);
% plot(t, x, ':d')
% 
% x0c = 1;
% [t,x] = ode23(@(t,x) 1 - x^14, tspan, x0c);
% plot(t, x, '--s')
% 
% x0d = 1.5;
% [t,x] = ode23(@(t,x) 1 - x^14, tspan, x0d);
% plot(t, x, '-*')

% x0e = -1.5;
% [t,x] = ode23(@(t,x) 1 - x^14, tspan, x0e);
% plot(t, x, '-*')

% Euler method:

ode4 = @(x) 1 - x.^14;
tmin = 0;
tmax = 0.25;
tstep = 0.006;
dxdt_a = eul(ode4, tmin, tmax, tstep, x0);
dxdt_b = eul(ode4, tmin, tmax, tstep, x0b);
dxdt_c = eul(ode4, tmin, tmax, tstep, x0c);
dxdt_d = eul(ode4, tmin, tmax, tstep, x0d);
% dxdt_e = eul(ode2, tmin, tmax, tstep, x0e);

plot(tmin:tstep:tmax, dxdt_a, '--d')
plot(tmin:tstep:tmax, dxdt_b, '--d')
plot(tmin:tstep:tmax, dxdt_c, '--d')
plot(tmin:tstep:tmax, dxdt_d, '--d')
% plot(tmin:tstep:tmax, dxdt_e, '--')

% Improved euler method:

dxdt_a2 = eul2(ode4, tmin, tmax, tstep, x0);
dxdt_b2 = eul2(ode4, tmin, tmax, tstep, x0b);
dxdt_c2 = eul2(ode4, tmin, tmax, tstep, x0c);
dxdt_d2 = eul2(ode4, tmin, tmax, tstep, x0d);
% dxdt_e2 = eul2(ode2, tmin, tmax, tstep, x0e);

plot(tmin:tstep:tmax, dxdt_a2, ':*')
plot(tmin:tstep:tmax, dxdt_b2, ':*')
plot(tmin:tstep:tmax, dxdt_c2, ':*')
plot(tmin:tstep:tmax, dxdt_d2, ':*')
% plot(tmin:tstep:tmax, dxdt_e2, ':')

hold off

title(legend(num2str(x0), num2str(x0b), num2str(x0c), num2str(x0d)), 'x0')

% hold off

% 4) Locally stable at x = +/- 1. For x0 > -1, converges on x = 1. For x0 <
% -1 (not shown), decreases rapidly.

%% About me and my goals
%
% My main area of interest is in lexical knowledge. In particular, I am
% interested in how words are organized and how they interact with one
% another, as well as how they are acquired and what that might mean for 
% the structure of their relationships. Graph theoretical networks are a
% growing topic of interest in this area, and a tool that I have been
% gaining experience with. One of the major criticisms of these networks,
% though, is that although predictions about function can be made to some
% extent based on the structure of the network, the networks themselves are
% static. Bringing in dynamics could help to enrich these networks and help
% make functional predictions more concrete. One dynamical system that I
% would like to be able to create would be a model of lexical
% acquisition---which words are acquired and when---based on the
% relationshops between the novel words and existing words, and on the
% properties of the environment in which the word is encountered.





