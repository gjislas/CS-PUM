function f = power(f,g)

if isa(g,'fourier2')
    f = comp(f,@power,g);
else
    f = comp(f,@(f) f.^g);
end