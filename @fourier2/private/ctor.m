function g = ctor(g, op , ends , nx, ny, scl )
% fourier2 constructor 

% nonadaptive case
g.map = linear2D(ends);  
if mod(nx,2)~=0
    error('fourier2:ctor:npoints','number of points in the x-direction must be even')
end
if mod(ny,2)~=0
    error('fourier2:ctor:npoints','number of points in the y-direction must be even')
end
g.nx = nx;
g.ny = ny;
[x,y] = fourierpts2(nx,ny,ends);

g.vals = op(x,y);
g.vals(1,:) = 0;
g.vals(:,1) = 0;
if nargin < 6
    scl = 0;
end

g.scl = max(scl,max(max(abs(g.vals))));



