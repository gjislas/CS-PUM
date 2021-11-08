function p = surf(g)

x = chebfun2(@(t,p) cos(t).*cos(p), g.d);
y = chebfun2(@(t,p) sin(t).*cos(p), g.d);
z = chebfun2(@(t,p) sin(p), g.d);
if nargout > 0 
    p = surf(x,y,z,g.four);
else
    surf(x,y,z,g.four);
end