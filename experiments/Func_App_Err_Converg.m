%Interpolation Nodes
[xx,yy,zz] = sphere(500);

%True Functions
u1 = @(x,y,z) sin(100*x.*y.*z);
u2 = @(x,y,z) 1./(1+100*(x.^2+y.^2));
u3 = @(x,y,z) cos(x.*z - sin (y));
u4 = @(x,y,z) sqrt(1.05+x.*y.*z);

%Function Samples
u1_vals = u1(xx,yy,zz);
u2_vals = u2(xx,yy,zz);
u3_vals = u3(xx,yy,zz);
u4_vals = u4(xx,yy,zz);

%Error compution for various values of N
NN = 50:2:150;
err = zeros(4,length(NN));
for k = 1:length(NN)
    N = NN(k);
    u1_app = sph(u1,N); %cubed sphere method approximation
    err(1,k) = norm(u1_vals-u1_app(xx,yy,zz),'inf');
    
    u2_app = sph(u2,N); %cubed sphere method approximation
    err(2,k) = norm(u2_vals-u2_app(xx,yy,zz),'inf');
    
    u3_app = sph(u3,N); %cubed sphere method approximation
    err(3,k) = norm(u3_vals-u3_app(xx,yy,zz),'inf');
    
    u4_app = sph(u4,N); %cubed sphere method approximation
    err(4,k) = norm(u4_vals-u4_app(xx,yy,zz),'inf');
end

%Error  compution for larger values of N
NN2 = 150:2:340;
for k = 1:length(NN2)
    N = NN2(k);
    u2_app = sph(u2,N); %cubed sphere method approximation
    err_cont(k) = norm(u2_vals-u2_app(xx,yy,zz),'inf');
end

%% Plots

%Function Plots
figure(1)
surf(xx,yy,zz,u1(xx,yy,zz))
shading interp
title('$$u_1 = \sin(100xyz)$$','interpreter','latex')
set(gca,'fontsize', 16,'LineWidth',1.5)
axis equal
set(gca,'color','none')
axis off
grid off
view(-50,15)
figure(2)
surf(xx,yy,zz,u2(xx,yy,zz))
shading interp
title('$$u_2 = 1/(1+100(x^2+y^2))$$','interpreter','latex')
set(gca,'fontsize', 16,'LineWidth',1.5)
axis equal
set(gca,'color','none')
axis off
grid off
view(-50,15)
figure(3)
surf(xx,yy,zz,u3(xx,yy,zz))
shading interp
title('$$u_3 = \cos(xz-\sin(y))$$','interpreter','latex')
set(gca,'fontsize', 16,'LineWidth',1.5)
axis equal
set(gca,'color','none')
axis off
grid off
view(110,15)
figure(4)
surf(xx,yy,zz,u4(xx,yy,zz))
shading interp
title('$$u_4 = \sqrt{1.05+xyz}$$','interpreter','latex')
set(gca,'fontsize', 16,'LineWidth',1.5)
axis equal
set(gca,'color','none')
axis off
grid off
view(-35,15)

%Error Plots
figure(1)
subplot(221)
semilogy(NN,err(1,:),'LineWidth',2.5)
xlabel('$$N$$','interpreter','latex')
ylabel('Error (log)','interpreter','latex')
title('$$u_1 = \sin(100xyz)$$','interpreter','latex')
ylim([1e-12 1])
set(gca,'fontsize', 14)
subplot(222)
semilogy([NN NN2],[err(2,:) err_cont],'LineWidth',2.5)
xlabel('$$N$$','interpreter','latex')
ylabel('Error (log)','interpreter','latex')
title('$$u_2 = 1/(1+100(x^2+y^2))$$','interpreter','latex')
ylim([1e-12 1])
xlim([0 340])
set(gca,'fontsize', 14)
subplot(223)
semilogy(NN(1:5:end),err(3,1:5:end),'LineWidth',2.5)
xlabel('$$N$$','interpreter','latex')
ylabel('Error (log)','interpreter','latex')
title('$$u_3 = \cos(xz-\sin(y))$$','interpreter','latex')
ylim([1e-12 1])
set(gca,'fontsize', 14)
subplot(224)
semilogy(NN(1:5:end),err(4,1:5:end),'LineWidth',2.5)
xlabel('$$N$$','interpreter','latex')
ylabel('Error (log)','interpreter','latex')
title('$$u_4 = \sqrt{1.05+xyz}$$','interpreter','latex')
ylim([1e-12 1])
set(gca,'fontsize', 14)