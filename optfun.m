function f = optfun(x,xi,yi)
    f = 0;
    for kk = 1:numel(xi)
        f = f + ((xi(kk) - x(1))^2 + (yi(kk) - x(2))^2);
    end