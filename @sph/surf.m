function varargout = surf(f,varargin)
% SURF surface plot of a SDOMAIN object
% SURF(F,ARGIN) calls SURF(F.FOUR2,ARGIN)

% Evaluate SDOMAIN on a 100x100 grid
%d = f.four2.map.par;

[xx,yy,zz]=sphere(300);

ww = real(feval(f,xx,yy,zz));

defaultopts = {'facecolor','interp','edgealpha',.5,'edgecolor','none'};

if nargout > 0
    varargout{:} = surf(xx,yy,zz,ww,defaultopts{:},varargin{:});
else 
    surf(xx,yy,zz,ww,defaultopts{:},varargin{:},'FaceAlpha',1)
end

axis equal off