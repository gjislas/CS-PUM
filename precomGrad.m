function varargout = precomGrad(f)

N = f.subdom{1}.four2.nx; S = cell(6,1); mask = cell(6,1);
x = zeros(6*N,N); y = zeros(6*N,N); z = zeros(6*N,N);
wx = cell(6,1); wy = cell(6,1); wz = cell(6,1);
th_proj = cell(6,1); ph_proj = cell(6,1);
R1 = cell(6,1); R2 = cell(6,2);

[th,ph] = fourierpts2(f.subdom{1}.four2.nx,f.subdom{1}.four2.ny,...
    f.subdom{1}.dom);
[xx,yy,zz] = mapCSfor(th,ph);

% gradient of w

for k = 1:6    
    %cartesian coordinates
    switch k
        case 2
            temp = yy; yy = xx; xx = -temp;
        case 3
            temp = xx; xx = -yy; yy = temp;
        case 4
            temp = yy; yy = xx; xx = -temp;
        case 5
            temp = xx; xx = zz; zz = yy; yy = temp;
        case 6
            xx = -xx; zz = -zz; 
    end
  
    x((k-1)*N+1:N*k,:) = xx;
    y((k-1)*N+1:N*k,:) = yy;
    z((k-1)*N+1:N*k,:) = zz;
    
    S{k} = wevalS(xx,yy,zz,f.subdom{k}.w.lam,f.subdom{k}.w.alpha);
    
    alpha = f.subdom{1}.w.alpha;
    lam = f.subdom{1}.w.lam;
    wth = -alpha*2*lam*th.^(2*lam-1).*exp(-alpha*(th.^(2*lam)+ph.^(2*lam)));
    wph = -alpha*2*lam*ph.^(2*lam-1).*exp(-alpha*(th.^(2*lam)+ph.^(2*lam)));
    [R1{k},R2{k}] = gradMatrix(th,ph,k);
    wx{k} = R1{k}.x.*wth + R2{k}.x.*wph;
    wy{k} = R1{k}.y.*wth + R2{k}.y.*wph;
    wz{k} = R1{k}.z.*wth + R2{k}.z.*wph;
    
end

for k = 1:6
    xtemp = x; xtemp((k-1)*N+1:N*k,:) = [];
    ytemp = y; ytemp((k-1)*N+1:N*k,:) = [];
    ztemp = z; ztemp((k-1)*N+1:N*k,:) = [];
    
    [t,p] = mapCSinv(xtemp,ytemp,ztemp,k);
    d = f.subdom{k}.dom; %Fourier2 domain
    
    mask{k} = t>d(1) & t<d(2) & p>d(3) & p<d(4);
    
    th_proj{k} = t(mask{k}); ph_proj{k} = p(mask{k});   
end

[nnx,nny] = meshgrid(1i*[0:N/2 -N/2+1:-1], 1i*[0:N/2 -N/2+1:-1]);

if nargout == 10
    varargout={S,th_proj,ph_proj,wx,wy,wz,mask,R1,R2,nnx,nny};
else
    precom.S = S;
    precom.thP = th_proj;
    precom.phP = ph_proj;
    precom.wx = wx;
    precom.wy = wy;
    precom.wz = wz;
    precom.mask = mask;
    precom.R1 = R1;
    precom.R2 = R2;
    precom.nnx = nnx;
    precom.nny = nny;
    varargout={precom};
end
    
    