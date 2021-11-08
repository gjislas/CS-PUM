function [X,Y,Z] = mapCSfor(th,ph,th0,ph0)
% MAP genrates a map for a SDOMAIN object
% MAP(Cx,Cy,T) generates a map from the regular grid [-T,T]x[-T,T] to a
% subdomain on the unit sphere (CUBED SPHERE MAP) centered at 
% (Cx,Cy) (in spherical coords).  
%

if nargin < 2
    th0 = 0;
    ph0 = 0;
end

M1 = makehgtform('zrotate',th0);
M1 = M1(1:3,1:3);
M2 = makehgtform('yrotate',ph0);
M2 = M2(1:3,1:3);
M = M1*M2;

S = sqrt(1+tan(th).^2+tan(ph).^2);
X = ones(size(th))./S;
Y = tan(th)./S;
Z = tan(ph)./S;
rotate = [X(:) Y(:) Z(:)]*M.';
X = reshape(rotate(:,1),size(th));
Y = reshape(rotate(:,2),size(th));
Z = reshape(rotate(:,3),size(th));
%m.for = @(x,y) {ones(size(x))./S(x,y), tan(x)./S(x,y), tan(y)./S(x,y) };
%m.inv = @(X,Y,Z) {atan(Y./X), atan(Z./X)};