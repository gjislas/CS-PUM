function [X,Y,Z] = mapCSfor(th,ph,center)
% MAP genrates a map for a SDOMAIN object
% MAP(Cx,Cy,T) generates a map from the regular grid [-T,T]x[-T,T] to a
% subdomain on the unit sphere (CUBED SPHERE MAP) centered at 
% (Cx,Cy) (in spherical coords).  
%


if nargin < 3
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

S = sqrt(1+th.^2+ph.^2);
X = ones(size(th))./S;
Y = th./S;
Z = ph./S;
rotate = [X(:) Y(:) Z(:)]*M.';
X = reshape(rotate(:,1),size(th));
Y = reshape(rotate(:,2),size(th));
Z = reshape(rotate(:,3),size(th));
