function bifplot(xstar, rmin, rmax, rstep, rcrit, stable)
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
    % x1

    % x1 = zeros(1, length(r1));
    % x2 = zeros(1, length(r2));
    % for n = 1:length(r1)
    %     thisr = r1(n);
    %     x1(n) = feval(xstar, thisr);
    % end
    % for n = 1:length(r2)
    %     thisr = r2(n);
    %     x2(n) = feval(xstar, thisr);
    % end
    % xst2 = feval(xstar, r2);
    plot(r1, feval(xstar, r1), a)
    % hold on
    plot(r2, feval(xstar, r2), b)
    % plot(rtot, zeros(1, length(rtot)), 'k');
    % plot(zeros(1, length(rtot)), rtot, 'k');
    % hold off
    xlabel('                    r');
    ylabel('                    x');
end
