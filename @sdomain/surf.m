function varargout = surf(f,varargin)
% SURF surface plot of a SDOMAIN object
% SURF(F,ARGIN) calls SURF(F.FOUR2,ARGIN)

% Evaluate SDOMAIN on a 100x100 grid
%d = f.four2.map.par;
d = f.dom;
th = linspace(d(1),d(2),100);
ph = linspace(d(3),d(4),100);
[TH,PH] = meshgrid(th,ph);
[xx,yy,zz] = mapCSfor(TH,PH,f.id);
ww = feval(f.four2,th,ph,'mesh');

defaultopts = {'facecolor','interp','edgealpha',.5,'edgecolor','none'};

ish = ishold;

% Plot sphere
[X,Y,Z] = sphere; surf(X,Y,Z,0*X,defaultopts{:},'FaceAlpha',.0), hold on

% Plot SDOMAIN
if nargout > 0
    varargout{:} = surf(xx,yy,zz,ww,defaultopts{:},varargin{:});
else 
    surf(xx,yy,zz,real(ww),defaultopts{:},varargin{:},'FaceAlpha',1)
end

% Plot boundary
Nb = 100;
tb = [d(1)*ones(1,Nb) linspace(d(1),d(2),Nb) d(2)*ones(1,Nb) linspace(d(2),d(1),Nb)];
pb = [linspace(d(3),d(4),Nb) d(4)*ones(1,Nb) linspace(d(4),d(3),Nb) d(3)*ones(1,Nb)];
[xb,yb,zb] = mapCSfor(tb,pb,f.id);
plot3(xb,yb,zb,'k','linewidth',2)

if ~ish
    hold off
end
axis equal off