function w = feval(f,x,y,z)
% Evaluate SDOMAIN object
% w = feval(f,x,y,z)

if any(abs(x.^2+y.^2+z.^2-1)>1e-10)
    error('points are not on the sphere')
end

[th,ph] = mapCSinv(x,y,z,f.id);
d = f.dom; % Fourier2 doamin

w = zeros(size(th));

mask = th>d(1) & th<d(2) & ph>d(3) & ph<d(4);
if any(mask(:))
    S = wevalS(x(mask),y(mask),z(mask),f.w.lam,f.w.alpha);
    w(mask) = feval(f.four2,th(mask),ph(mask))./S;
end