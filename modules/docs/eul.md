# `eul`: Integrate using the Euler method.

**Adapted from in-class example.**

## Usage:

```{MATLAB}
eul(dxdt, t0, tn, dt, x0)
```

## Arguments:

`dxdt`: a function or function handle to Integrate  
`t0`: time t at start  
`tn`: time t at end  
`dt`: size of time steps  
`x0`: initial condition  

## Code:

```{MATLAB}
function eulx = eul(dxdt, t0, tn, dt, x0)
    t = t0:dt:tn;
    nsteps = length(t);
    eulx = zeros(1, nsteps);
    eulx(1) = x0;

    for n = 2:nsteps
        dx = feval(dxdt, eulx(n-1));
        eulx(n) = eulx(n-1) + dx*dt;
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
    dx = feval(dxdt, eulx(n-1));
```

For each step `n` in `t`, evaluate `dxdt` at `n-1`. This will serve as the slope for the next calculation.

```{MATLAB}
eulx(n) = eulx(n-1) + dx*dt;
end
end
```

Multiply `dx*dt` and add to the previous value, `eulx(n-1)` to get the current value.

Returns the vector `eulx` when the iteration is complete.


## Example:

```{MATLAB}
my_ode = @(x) -3*x;
x0 = 1;
t0 = 0;
tn = 5;
dt = 0.1;
xt = eul(my_ode, t0, tn, dt, x0);
plot(t0:dt:tn, xt, '--d')
```
