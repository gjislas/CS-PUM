% Test convergence

N = 30:10:130;
err = 0*N;
[xx,yy,zz] = sphere(300);
exact = sin(10*zz).*cos(10*xx);
for k =1:length(N)
    k
    g = sph(@(x,y,z) 0*x+1,N(k));
    [gx,gy,gz] = grad(g);
    dv = div(gx,gy,gz);
    gx = feval(gx,xx,yy,zz);
    err(k) = norm(gx(:),inf);
    %gg = feval(g,xx,yy,zz);
    %err(k) = norm(gg(:)-exact(:),inf);
end
semilogy(N,err,'*')