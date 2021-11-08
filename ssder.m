function [ssth,ssph] = ssder(n,w)
                
dom = w.d*[-1 1 -1 1];
[th,ph] = fourierpts2(n,n,dom);
[x,y,z] = mapCSfor(th,ph,1);
 ws1 = wevalS(x,y,z, w.lam, w.alpha);
% W = [ws(:,end) ws ws(:,1)];
% ssth = (W(:,1:end-2) - W(:,3:end))/(th(1,3)-th(1,1));
% ssth = ssth./ws;
% W = [ws(end,:);ws;ws(1,:)];
% ssph = (W(1:end-2,:) - W(3:end,:))/(ph(3,1)-ph(1,1));
% ssph = ssph./ws;

ws = chebfun2(@(th,ph) wevalS1(th,ph,w) ,dom);
ssph = diff(ws,1,1); ssph = ssph(th,ph)./ws1;
ssth = diff(ws,1,2); ssth = ssth(th,ph)./ws1;

   function ss = wevalS1(th,ph,w)
        %S = sqrt(1+tan(th).^2+tan(ph).^2);
        %xx = 1./S;
        %yy = tan(th)./S;
        %zz = tan(ph)./S;
        [xx,yy,zz] = mapCSfor(th,ph,1);
        ss = wevalS(xx,yy,zz, w.lam, w.alpha);
   end
end