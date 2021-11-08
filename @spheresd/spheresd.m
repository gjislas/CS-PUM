classdef spheresd
    properties  ( GetAccess = 'public' , SetAccess = 'public' )
        four              % Fourfun
        wind              % window function
        d                 % domain
        lam               % lambda
        id                % subdomain id
    end
    
    methods
        function g = spheresd(f,N,id,lam,W,d)
            if( nargin == 0 )
            else              
                if nargin < 4                  
                    lam = max(4,round(N/24));
                    [W,d] = pw(lam); 
                end
                
                fsp = @(th,ph) f(cos(th).*cos(ph),sin(th).*cos(ph),sin(ph));
                dom = d*[-1,1,-1,1];
                
                switch id
                    case 1
                        F = chebfun2(@(th,ph) fsp(th,ph).*W(th,ph), dom);
                    case 2
                        dom(1:2) = dom(1:2)+pi/2;
                        F = chebfun2(@(th,ph) fsp(th,ph).*W(th-pi/2,ph), dom);
                    case 3
                        dom(1:2) = dom(1:2)+pi;
                        F = chebfun2(@(th,ph) fsp(th,ph).*W(th-pi,ph), dom);
                    case 4
                        dom(1:2) = dom(1:2)-pi/2;
                        F = chebfun2(@(th,ph) fsp(th,ph).*W(th+pi/2,ph), dom);
                    case 5
                        dom(3:4) = dom(3:4)-pi/2;
                        F = chebfun2(@(th,ph) fsp(th,ph).*W(th,ph+pi/2), dom);
                    case 6
                        dom(3:4) = dom(3:4)+pi/2;
                        F = chebfun2(@(th,ph) fsp(th,ph).*W(th,ph-pi/2), dom);
                    otherwise
                        error('id must be 1,2,...,6 (the face number)')
                end
                g.four = F;
                g.wind = W;
                g.lam = lam;
                g.id = id;
                g.d = dom;
            end
        end
        
        
    end
end
    