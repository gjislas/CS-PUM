function f = mtimes(s,f)

if isfloat(f)
    f = mtimes(f,s);
end
f.four2.vals = s*f.four2.vals;
