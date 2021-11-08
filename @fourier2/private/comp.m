function fout = comp(f, op, g, pref)
% FOUT = COMP(F1,OP,F2)
% COMP(F1,OP) returns the composition of the chebfun F with OP, i.e.,
%   FOUT = OP(F1).
% COMP(F,OP,F2) returns the composition of OP with chebfuns F and F2 with, 
%   i.e., FOUT = OP(F1,F2).
%
% Examples
%        x = chebfun('x')
%        Fout = comp(x,@sin)
%        Fout = comp(x+1,@power,x+5)

% Copyright 2011 by The University of Oxford and The Chebfun Developers. 
% See http://www.maths.ox.ac.uk/chebfun/ for Chebfun information.

% Note: this function does not deal with deltas! It will delete them!
% Only the first row of imps is updated. 

if nargin == 2
    fout = f;
    fout.vals = op(f.vals);
    fout.scl = op(f.scl);
else
    f = prolong(f,max(f.nx,g.nx),max(f.ny,g.ny));
    g = prolong(g,max(f.nx,g.nx),max(f.ny,g.ny));
    fout = f;
    fout.vals = op(f.vals,g.vals);
    fout.scl = max(max(abs(fout.vals)));
end