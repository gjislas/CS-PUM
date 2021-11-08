% plot faces

[th,ph] = meshgrid(linspace(-pi/3,pi/3,21));
[x,y,z] = mapCSfor(th,ph,0,0);
surf(x,y,z)
hold on
[x,y,z] = mapCSfor(th,ph,pi/2,0);
surf(x,y,z)
[x,y,z] = mapCSfor(th,ph,-pi/2,0);
surf(x,y,z)
[x,y,z] = mapCSfor(th,ph,pi,0);
surf(x,y,z)
[x,y,z] = mapCSfor(th,ph,0,pi/2);
surf(x,y,z)
[x,y,z] = mapCSfor(th,ph,0,-pi/2);
surf(x,y,z)
hold off
axis equal

[th2,ph2] = mapCSinv(x,y,z,0,-pi/2);
norm(th-th2)
norm(ph-ph2)