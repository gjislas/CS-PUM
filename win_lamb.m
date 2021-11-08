function g=win(lambda)

g.lam = lambda;
% solve w(1) = 0.5 for alpha
%g.alpha = -log(0.5);
% solve w(d) = eps for d
%g.d = (-log(eps)./alpha)^(1./(2*g.lam));
g.d = 1.25;
g.alpha = -log(eps)*g.d^(-2*g.lam);
          


