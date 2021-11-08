[x,y,z] = sphere(100);
f = exp(-10*(((x-1).^2+y.^2+z.^2)));
surf(x,y,z,f), shading interp
axis off, axis image
shg