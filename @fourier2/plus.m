function f = plus(f,g)

if isfloat(f) 
    f = plus(g,f);
elseif isfloat(g)
    if max(size(g)) > 1
        error('fourier2:plus:input','dimensions must agree')
    end
    f.vals = f.vals + g;
    f.scl = f.scl + g;          % worst case scenario
else
    f = prolong(f,max(f.nx,g.nx),max(f.ny,g.ny));
    g = prolong(g,max(f.nx,g.nx),max(f.ny,g.ny));
    f.vals = f.vals+g.vals;
    f.scl = f.scl + g.scl;      % worst case scenario
end