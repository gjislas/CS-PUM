function varargout = grad(f,pc)

Gx = f; Gy = f; Gz = f;

if nargin < 2
   pc = precomGrad(f);
end

N = f.subdom{1}.four2.nx;

for k = 1:6
 vals((k-1)*N+1:N*k,:) = f.subdom{k}.four2.vals;
end

for k = 1:6
    w = zeros(5*N,N);
    if any(pc.mask{k}(:))
        w(pc.mask{k}) = feval(f.subdom{k}.four2,pc.thP{k},pc.phP{k});
    end  
    vals([1:((k-1)*N) (k*N+1):end],:) = vals([1:((k-1)*N) (k*N+1):end],:)+w;
end

for k = 1:6
    [gwx,gwy,gwz] = grad(f.subdom{k},pc.nnx,pc.nny,pc.R1{k},pc.R2{k});
    
    %product rule
    Gx.subdom{k}.four2.vals = gwx.four2.vals - pc.wx{k}.*vals((k-1)*N+1:N*k,:)./pc.S{k};
    Gy.subdom{k}.four2.vals = gwy.four2.vals - pc.wy{k}.*vals((k-1)*N+1:N*k,:)./pc.S{k};
    Gz.subdom{k}.four2.vals = gwz.four2.vals - pc.wz{k}.*vals((k-1)*N+1:N*k,:)./pc.S{k};
end

if nargout == 3
    varargout={Gx,Gy,Gz};
else
    varargout={[Gx,Gy,Gz]};
end
