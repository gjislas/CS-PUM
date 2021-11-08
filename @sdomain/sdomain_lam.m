classdef sdomain
    properties  ( GetAccess = 'public' , SetAccess = 'public' )
        w           % window parameter 
        four2       % function values on the grid
        id
        dom
        ssth
        ssph
    end
        
    methods
        function g = sdomain (f, id, N, scl, ssth, ssph,lam)
            if( nargin == 0 )
            else
                if nargin<4
                    scl = 0;
                end
                %lam = 4;%
                %lam = max(4,round(N/48));
                ww = win(lam);
                if nargin < 5
                    [ssth,ssph] = ssder(N,ww);
                end
                g.dom = ww.d*[-1 1 -1 1];
                g.ssth = ssth;
                g.ssph = ssph;
                four = fourier2(@(th,ph) fmapped(f,th,ph,ww,id), g.dom , N, N, scl);
                %four = chebfun2(@(th,ph) fmapped(f,th,ph,ww,id),[N,N], g.dom);
                %four = chebfun2(@(th,ph) fmapped(f,th,ph,ww,id), g.dom);


                g.four2 = four;
                g.w = ww;
                g.id = id;
            end
            
            % Cubbed Sphere mapping
            function w = fmapped(f,th,ph,w,id)
                [x,y,z] = mapCSfor(th,ph,id2center(id));
                %w = f(x,y,z).*feval(ww,th,ph);
                w = feval(f,x,y,z).*weval(x,y,z,w.lam,w.alpha,id);
            end
            
        end
    end
end