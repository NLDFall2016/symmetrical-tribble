function eulx = eul2(dxdt, t0, tn, dt, x0)
% EUL2  Integrate using the improved Euler method.
%   EULX = EUL(dxdt, t0, tn, dt, x0)
%   dxdt: a function or function handle to Integrate
%   t0: time t at start
%   tn: time t at end
%   dt: size of time steps
%   x0: initial condition
%   *Adapted from in-class example and EUL.*
    t = t0:dt:tn;
    nsteps = length(t);
    eulx = zeros(1, nsteps);
    eulx(1) = x0;

    for n = 2:nsteps
        last = eulx(n-1);
        dx = feval(dxdt, last);
        xish = last + dx*dt;
        dxish = feval(dxdt, xish);
        eulx(n) = last + ((dx + dxish)/2)*dt;
    end
end
