function df = diffth(f)

df = f;

[th,ph] = fourierpts2(f.four2.nx,f.four2.ny,f.four2.map.par);

[x,y,z] = mapCSfor(th,ph);

g = diff(f.four2,1,0);

df.four2.vals =  g.vals - f.four2.vals.*wevalSth(x, y,z, f.w.lam, f.w.alpha)./ ...
    wevalS(x, y,z, f.w.lam, f.w.alpha);