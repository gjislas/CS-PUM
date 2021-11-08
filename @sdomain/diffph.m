function df = diffph(f)

df = f;

[th,ph] = fourierpts2(f.four2.nx,f.four2.ny,f.four2.map.par);

[x,y,z] = mapCSfor(th,ph);

g = diff(f.four2,0,1);

df.four2.vals =  g.vals - f.four2.vals.*wevalSph(x, y,z, f.w.lam, f.w.alpha)./ ...
    wevalS(x, y,z, f.w.lam, f.w.alpha);