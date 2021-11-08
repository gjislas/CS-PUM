classdef sph
    properties  ( GetAccess = 'public' , SetAccess = 'public' )
        subdom
        N
    end
        
    methods
        function g = sph(f,N,lam)
            if( nargin == 0 )
            else
                g.N = N;
                if nargin < 3
                %lam = 4;
                %lam = max(4,round(N/48));
                 w = win(lam);
                [ssth,ssph] = ssder(N,w);
                else
                    ssth = []; ssph = [];
                end
                for k = 1:6
                    g.subdom{k} = sdomain (f,  k, N, 1, ssth, ssph,lam);
                end
            end
        end
    end
end