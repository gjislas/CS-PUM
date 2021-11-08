function [th,ph] = mapCSinv(X,Y,Z,center)
% MAP genrates a map for a SDOMAIN object
% MAP(Cx,Cy,T) generates a map from the regular grid [-T,T]x[-T,T] to a
% subdomain on the unit sphere (CUBED SPHERE MAP) centered at 
% (Cx,Cy) (in spherical coords).  
%
%Generates map from sphere to plane, (th,ph) = (y,z) since x = 1.


if nargin < 4
    th0 = 0;
    ph0 = 0;
else
    if length(center) == 1
    center = id2center(center);
    end
    th0 = center(1);
    ph0 = center(2);
end

M1 = makehgtform('zrotate',th0);
M1 = M1(1:3,1:3);
M2 = makehgtform('yrotate',-ph0);
M2 = M2(1:3,1:3);
M = M1*M2;

rotate = [X(:) Y(:) Z(:)]*M;
rotate(rotate(:,1)<=0,:,:) = nan;
th = reshape(rotate(:,2)./rotate(:,1),size(X));
ph = reshape(rotate(:,3)./rotate(:,1),size(X));
