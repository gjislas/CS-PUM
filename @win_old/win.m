classdef win
    properties  ( GetAccess = 'public' , SetAccess = 'public' )
        d        % window parameter 
        lam         % function values on the grid
        alpha
    end
        
    methods
        function g = win(lambda)
            if( nargin == 0 )
            else
                g.lam = lambda;
                g.alpha = -log(0.3)/(pi/4)^(2*g.lam);
                g.d = 10^((log10(14)-log10(g.alpha)-log10(log10(exp(1))))/(2*g.lam));
            end
        end
        
        function w = feval(g,x,y,z)
            
            mask = x > 0;
            w1 = 0*x;
            [th,ph] = mapCSinv(x(mask),y(mask),z(mask),[0,0]);
            w1(mask) = exp(-g.alpha*(th.^(2.*g.lam)+ph.^(2.*g.lam)));
           
            mask = y > 0; %& w1 >0; 
            w2 = 0*w1;
            [th,ph] = mapCSinv(x(mask),y(mask),z(mask),[pi/2,0]);
            w2(mask) = exp(-g.alpha*((th).^(2.*g.lam)+ph.^(2.*g.lam)));
            w = w1+w2;
            
            mask = y < 0; %& w1 >0; 
            w2 = 0*w1;
            [th,ph] = mapCSinv(x(mask),y(mask),z(mask),[-pi/2,0]);
            w2(mask) = exp(-g.alpha*((th).^(2.*g.lam)+ph.^(2.*g.lam)));
            w = w+w2;
            
            mask = z < 0; %& w1 >0; 
            w2 = 0*w1;
            [th,ph] = mapCSinv(x(mask),y(mask),z(mask),[0,-pi/2]);
            w2(mask) = exp(-g.alpha*((th).^(2.*g.lam)+(ph).^(2.*g.lam)));
            w = w+w2;
            
            mask = z > 0;% & w1 >0; 
            w2 = 0*w1;
            [th,ph] = mapCSinv(x(mask),y(mask),z(mask),[0,pi/2]);
            w2(mask) = exp(-g.alpha*((th).^(2.*g.lam)+(ph).^(2.*g.lam)));
            w = w+w2;
            
            mask = x < 0;% & w1 >0; 
            w2 = 0*w1;
            [th,ph] = mapCSinv(x(mask),y(mask),z(mask),[pi,0]);
            w2(mask) = exp(-g.alpha*((th).^(2.*g.lam)+(ph).^(2.*g.lam)));
            w = w+w2;
    
            %w = w1./w;
            %w(w1==0) = 0;
        end
        
    end
    
    
end