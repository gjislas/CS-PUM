function f = times(f,g)

% Notice this is not yet adaptive
f = prolong(f,max(f.nx,g.nx),max(f.ny,g.ny));
g = prolong(g,max(f.nx,g.nx),max(f.ny,g.ny));
f.vals = f.vals.*g.vals;
f.scl = f.scl*g.scl;
