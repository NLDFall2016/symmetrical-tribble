function eulx = eul2(dxdt, t0, tn, dt, x0) 
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