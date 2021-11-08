% Test convergence

N = 20:10:130;
err = 0*N;
[xx,yy,zz] = sphere(300);
exact = sin(10*zz).*cos(10*xx);
for k =1:length(N)
    k
    g = sph(@(x,y,z) sin(10*z).*cos(10*x),N(k));
    gg = feval(g,xx,yy,zz);
    err(k) = norm(gg(:)-exact(:),inf);
end
semilogy(N,err,'*')