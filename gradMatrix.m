% Discrete gradient
function [R1,R2] = gradMatrix(th,ph,id)

S = sqrt(1+th.^2+ph.^2);

xth1 = -th./S.^3;
yth1 = -th.^2./S.^3+1./S;
zth1 = -th.*ph./S.^3;

xph1 = -ph./S.^3;
yph1 = -th.*ph./S.^3;
zph1 = -ph.^2./S.^3+1./S;

switch id
    case 1
        xth = xth1; yth = yth1; zth = zth1;
        xph = xph1; yph = yph1; zph = zph1;
    case 2
        xth = -yth1; yth = xth1; zth = zth1;
        xph = -yph1; yph = xph1; zph = zph1;        
    case 3
        xth = -xth1; yth = -yth1; zth = zth1;
        xph = -xph1; yph = -yph1; zph = zph1;
    case 4
        xth = yth1; yth = -xth1; zth = zth1;
        xph = yph1; yph = -xph1; zph = zph1;
    case 5
        xth = zth1; yth = yth1; zth = -xth1;
        xph = zph1; yph = yph1; zph = -xph1;
    case 6
        xth = -zth1; yth = yth1; zth = xth1;
        xph = -zph1; yph = yph1; zph = xph1;       
end
EE = (xth.*xth+yth.*yth+zth.*zth);
FF = (xph.*xth+yph.*yth+zph.*zth);
GG = (xph.*xph+yph.*yph+zph.*zph);

D = (EE.*GG - FF.^2);
R1.x = (GG.*xth -FF.*xph)./D; R2.x = (-FF.*xth + EE.*xph)./D;
R1.y = (GG.*yth -FF.*yph)./D; R2.y = (-FF.*yth + EE.*yph)./D;
R1.z = (GG.*zth -FF.*zph)./D; R2.z = (-FF.*zth + EE.*zph)./D;
end