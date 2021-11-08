function g = blend(f)
g = f;
for k = 1:6
     g.subdom{k} = sdomain(f,  k, f.N, 1, f.subdom{1}.ssth, f.subdom{1}.ssph);
end