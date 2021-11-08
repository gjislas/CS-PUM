function [Gx,Gy,Gz] = grad(f,nnx,nny,R1,R2)
% Gradient of an sdomain

%partial wrt th and ph
[wfth,wfph] = grad(f.four2,nnx,nny);

%gradient of wu
    gwx = R1.x.*wfth + R2.x.*wfph;
    gwy = R1.y.*wfth + R2.y.*wfph;
    gwz = R1.z.*wfth + R2.z.*wfph;

Gx = f; Gy = f; Gz = f; 

Gx.four2.vals = gwx;
Gy.four2.vals = gwy;
Gz.four2.vals = gwz;
end
