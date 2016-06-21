function r = Bessel(p)
t = linspace(0,1,100);
n = size(p,2) - 1;
r = 0;
for k = 0:n
    r = r + prod(1:n)/(prod(1:k)*prod(1:n - k))*p(:,k + 1)*(t.^k.*(1 - t).^(n - k)); 
end