function eulx = eul(dxdt, t0, tn, dt, x0) 
    %%% Adapted from in-class example
    t = t0:dt:tn;
    nsteps = length(t);
    eulx = zeros(1, nsteps);
    eulx(1) = x0;
    
    for n = 2:nsteps
        dx = feval(dxdt, eulx(n-1));
        eulx(n) = eulx(n-1) + dx*dt;
    end
end
    