function eulx = eul(dxdt, t0, tn, dt, x0)
% EUL  Integrate using the Euler method.
%   EULX = EUL(dxdt, t0, tn, dt, x0)
%   dxdt: a function or function handle to Integrate
%   t0: time t at start
%   tn: time t at end
%   dt: size of time steps
%   x0: initial condition
%   *Adapted from in-class example.*
    t = t0:dt:tn;
    nsteps = length(t);
    eulx = zeros(1, nsteps);
    eulx(1) = x0;

    for n = 2:nsteps
        dx = feval(dxdt, eulx(n-1));
        eulx(n) = eulx(n-1) + dx*dt;
    end
end
