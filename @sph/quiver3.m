function quiver3(f,g,h)

if nargin == 1
    g = f(2); h = f(3); f = f(1);
end

[T,P]=sphere_pts(0.15);
x = cos(T).*cos(P); y = sin(T).*cos(P); z = sin(P);
quiver3(x,y,z,feval(f,x,y,z),feval(g,x,y,z),feval(h,x,y,z),'k','linewidth',2)