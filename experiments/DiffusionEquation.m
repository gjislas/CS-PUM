%Initial Condition
u = sph(@(x,y,z) x.*y,100);

%Precomputing for the gradient operator
pc = precomGrad(u);
%time step
dt = 10^(-6);
tfinal = 1.5;

%% Forward Euler Time Stepping Scheme

for j = 1:tfinal/dt
    L = lap(u,pc); %laplacian operator
    u = dt*L + u; %forward Euler
end

%%
%Evaluation nodes
[xx,yy,zz] = sphere(100);
u_vals = u(xx,yy,zz);

%true solution
sol = @(t) exp(-6*t)*xx.*yy;

%Error
abs_err = norm(sol(1.5)-u(xx,yy,zz));
true_max = max(max(abs(sol(1.5))));
app_max = max(max(abs(u(xx,yy,zz))));  

%% Plots
%True solution
figure(1)
surf(xx,yy,zz,sol(tfinal))
title('Exact Solution, t=1.5')
shading interp
axis equal
colorbar
set(gca,'fontsize', 8)

%Approximation
figure(2)
surf(xx,yy,zz,u(xx,yy,zz))
title('Solution Approximation, t=1.5')
shading interp
axis equal
colorbar
set(gca,'fontsize', 8)

%Error
figure(3)
surf(xx,yy,zz,abs(u(xx,yy,zz)-sol(tfinal)))
title('Error, t=1.5')
shading interp
axis equal
colorbar
set(gca,'fontsize', 8)

        

