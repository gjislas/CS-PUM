function wout = wevalph(x,y,z,lam,alpha,id)

%ii = 1:6; ii(ii==id) = [];
w = wind1ph(x,y,z,lam,alpha,id);
wout = w;

return


   function w1 = wind1ph(x,y,z,lam,alpha,id)
        w1 = 0*x;
        switch id
            case 1
                mask = x > 0;
                [th,ph] = mapCSinv(x(mask),y(mask),z(mask),[0,0]);
                w1(mask) = -alpha*2*lam*ph.*exp(-alpha*(th.^(2.*lam)+ph.^(2.*lam)));
            case 2
                mask = y > 0; %& w1 >0;
                [th,ph] = mapCSinv(x(mask),y(mask),z(mask),[pi/2,0]);
                w1(mask) = -alpha*2*lam*ph.*exp(-alpha*((th).^(2.*lam)+ph.^(2.*lam)));
            case 3
                mask = x < 0; %& w1 >0;
                [th,ph] = mapCSinv(x(mask),y(mask),z(mask),[pi,0]);
                w1(mask) = -alpha*2*lam*ph.*exp(-alpha*((th).^(2.*lam)+ph.^(2.*lam)));
            case 4
                mask = y < 0; %& w1 >0;
                [th,ph] = mapCSinv(x(mask),y(mask),z(mask),[-pi/2,0]);
                w1(mask) = -alpha*2*lam*ph.*exp(-alpha*((th).^(2.*lam)+ph.^(2.*lam)));
            case 5
                mask = z < 0; %& w1 >0;
                [th,ph] = mapCSinv(x(mask),y(mask),z(mask),[0,-pi/2]);
                w1(mask) = -alpha*2*lam*ph.*exp(-alpha*((th).^(2.*lam)+ph.^(2.*lam)));
            case 6
                mask = z > 0; %& w1 >0;
                [th,ph] = mapCSinv(x(mask),y(mask),z(mask),[0,pi/2]);
                w1(mask) = -alpha*2*lam*ph.*exp(-alpha*((th).^(2.*lam)+ph.^(2.*lam)));
        end
    end

end