function f = mtimes(f,g)

if isfloat(f)
    f = mtimes(g,f);
elseif isfloat(g)
    if max(size(g))>1
        error('fourier2:mtimes:input','Only multiplication by a constant scalar supported in mtimes')
    end
    f.vals = f.vals*g;
    f.scl = f.scl*g;
else
    error('fourier2:mtimes:input','use .* to multiply two fourier2 objects')
end