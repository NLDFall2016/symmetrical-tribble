# `eul2`: Integrate using the improved Euler method.

**Adapted from in-class example.** See also `eul`.

## Usage:

```{MATLAB}
eul2(dxdt, t0, tn, dt, x0)
```

## Arguments:

`dxdt`: a function or function handle to Integrate  
`t0`: time t at start  
`tn`: time t at end  
`dt`: size of time steps  
`x0`: initial condition  

## Code:

```{MATLAB}
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
```

### Breakdown:

```{MATLAB}
function eulx = eul(dxdt, t0, tn, dt, x0)
    t = t0:dt:tn;
```

Creates a vector `t` ranging from `arg t0` to `arg tn` with `arg dt`-sized steps.

```{MATLAB}
 nsteps = length(t);
```

Determines the number of steps across which it will integrate based on the length of `t`.

```{MATLAB}
eulx = zeros(1, nsteps);
eulx(1) = x0;
```

Creates a vector `eulx` of length `nsteps`, and sets the first value equal to the initial condition (`arg x0`). This is where the solution will be stored.

```{MATLAB}
for n = 2:nsteps
    last = eulx(n-1);
    dx = feval(dxdt, last);
    xish = last + dx*dt;
```

Calculates the x-value according to the Euler method (see `eul`).

```{MATLAB}
dxish = feval(dxdt, xish);
```

Uses that value to calculate the what the next slope would be by the Euler method.

```{MATLAB}
eulx(n) = last + ((dx + dxish)/2)*dt;
end
end
```

Uses the average of these two values to calculate a more precise estimated x-value.

Returns the vector `eulx` when the iteration is complete.

## Example:

```{MATLAB}
my_ode = @(x) -3*x;
x0 = 1;
t0 = 0;
tn = 5;
dt = 0.1;
xt_imp = eul2(my_ode, t0, tn, dt, x0);
plot(t0:dt:tn, xt_imp, '--d')
```
