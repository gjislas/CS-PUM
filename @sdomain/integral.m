function I = integral(f)
% Gradient of an sdomain
% 

F = f.four2;
vals = F.vals;
%fth = diff(F,1,0);
%fph = diff(F,0,1);
[th,ph] = fourierpts2(F.nx,F.ny,f.dom);

 [x,y,z] = mapCSfor(th,ph,1);
 ws1 = wevalS(x,y,z, f.w.lam, f.w.alpha);
% W = [ws(:,end) ws ws(:,1)];
% ssth = (W(:,1:end-2) - W(:,3:end))/(th(1,3)-th(1,1));
% ssth = ssth./ws;
% W = [ws(end,:);ws;ws(1,:)];
% ssph = (W(1:end-2,:) - W(3:end,:))/(ph(3,1)-ph(1,1));
% ssph = ssph./ws;

%ws = chebfun2(@(th,ph) wevalS1(th,ph,f.w) ,f.dom);
%ssph = diff(ws,1,1); ssph = ssph(th,ph)./ws1;
%ssth = diff(ws,1,2); ssth = ssth(th,ph)./ws1;

%ssph2 = wevalSph(x,y,z, f.w.lam, f.w.alpha)./ ws1;
%ssth2 = wevalSth(x,y,z, f.w.lam, f.w.alpha)./ ws1;
%surf(th,ph,ssph-ssph2)
%shg
% surf(x,y,z,ssth), axis image
% shg
% pause
%Fv = f.four2.vals;
%Fth = (Fv(:,[2:end 1]) - Fv(:,1:end))./ (th(:,[2:end 1]) - th(:,1:end));
%Fph = (Fv([2:end 1],:) - Fv(1:end,:))./ (ph([2:end 1],:) - ph(1:end,:));

%[Gx,Gy,Gz] = gradMatrix(th,ph,Fth,Fph);
ds = area_element(th,ph,f.id);

I = sum(sum(vals.*ds./ws1))*(th(1,2)-th(1,1))^2;
% [x,y,z] = mapCSfor(th,ph,f.id);
% surf(x,y,z,f.four2.vals)
% surf(f)
% hold on;
% quiver3(x,y,z, gx,gy,gz,1,'k','linewidth',2)
% hold off


% Discrete gradient
function ds = area_element(th,ph,id)

%[x,y,z] = mapCSfor(th,ph,1);

%[t,p] = cart2sph(x,y,z);

% Tangent vectors to the surface.
%xt = -sin(t).*cos(p); yt = cos(t).*cos(p); zt = 0*t;
%xp = -cos(t).*sin(p); yp = -sin(t).*sin(p); zp = cos(p);

S = sqrt(1+tan(th).^2+tan(ph).^2);

Sth = tan(th).*sec(th).^2./S;
xth1 = -Sth./S.^2;
yth1 = sec(th).^2./S+tan(th).*xth1;
zth1 = tan(ph).*xth1;


Sph = tan(ph).*sec(ph).^2./S;
xph1 = -Sph./S.^2;
yph1 = tan(th).*xph1;
zph1 = sec(ph).^2./S+tan(ph).*xph1;

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

ds = sqrt((yth.*zph-zth.*yph).^2+(xth.*zph-zth.*xph).^2+(xth.*yph-yth.*xph).^2);

% surf(x,y,z), hold on
% quiver3(x,y,z,xph,yph,zph,'k')
% quiver3(x,y,z,xth,yth,zth,'k')
% xlabel('x')
% axis image
% hold off
% shg
% pause
end

end


