function out = bifplot(xstar, rmin, rmax, rstep, rcrit, stable)
    switch stable
        case 'before'
            a = '-';
            b = '--';
        case 'after'
            a = '--';
            b = '-';
        otherwise
            a = '-';
            b = '-';
            warn('Unrecognized value for "stable". Line will be solid.')
    end

    r1 = rmin:rstep:rcrit;
    r2 = rcrit:rstep:rmax;
    rtot = rmin:rstep:rmax;

    plot(r1, feval(xstar, r1), '--')
    hold on
    plot(r2, feval(xstar, r2), '-')
    plot(r,zeros(1,length(r)), 'k');
    plot(zeros(1,length(r)), r, 'k');
    hold off
    xlabel('r');
    ylabel('x');

    out=0
end
