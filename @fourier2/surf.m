function H = surf(f,varargin)
% SURF fourier2 surface plot
% Possible function calls
% SURF(Z,...)
% SURF(X,Y,Z,...)
% SURF(X,Y,Z,C,...)
% Here X,Y,Z, and C are fourier2 objects.

Nplot = 2^8; Mplot = 2^8; % Numper of gridpoints for surface plot (powers of 2)
vals = EvalPlot(f,Nplot,Mplot);

% parametric surface case
if (nargin > 1) && isa(varargin{1},'fourier2')
    if nargin < 3 || ~isa(varargin{2},'fourier2')
        error('fourier2:surf:input','Third argument must be a fourier2')
    end
    NarginStart = 3;
    xx = vals;
    yy = EvalPlot(varargin{1}, Nplot, Mplot);
    vals = EvalPlot(varargin{2}, Nplot, Mplot);
    
    % Coloring scheme (fourier2) is provided 
    if nargin >  3 && isa(varargin{3},'fourier2')
        NarginStart = 4;
        cc = EvalPlot(varargin{3},Nplot,Mplot);
    else
        cc = vals;
    end
    
else
    NarginStart = 1;
    [xx,yy] = fourierpts2(Nplot,Mplot,f.map.par,'close');
    cc = vals;
end

% Generate surface plot
def ={'facecolor','interp','edgealpha',.5,'edgecolor','none'};
if nargout == 0
    surf(xx,yy,vals,cc,varargin{NarginStart:end},def{:})
elseif nargout == 1
    H = surf(xx,yy,vals,cc,varargin{NarginStart:end},def{:});
else
    error('fourier2:surf:nargout','At most one output argument allowed')
end

end

% This function evaluates a fourier2 using prolong
function z = EvalPlot(f,N,M)
zf = prolong(f,N,M);
z = real(zf.vals);
z(:,end+1) = z(:,1);    % periodic value
z(end+1,:) = z(1,:);    % periodic value
end


