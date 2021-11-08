function zz = nfft2eval(f,x,y)

realvals = false;
if isreal(f)
    realvals = true;
end
fhat = fft2(f);
% Because domain is shifted [-pi pi]
k1=-f.nx/2:f.nx/2;
k2=-f.ny/2:f.ny/2;
[K1,K2]=ndgrid(k1,k2);
fhat = exp(K1*pi*1i+1i*K2*pi).*fhat;

N = [f.nx;f.ny];
x = f.map.inv(x(:),y(:));
X = [x{1},x{2}]/(2*pi);
mask1 = abs(X(:,1)-0.5)<1e-14;
X(mask1,1) = -0.5; 
mask2 = abs(X(:,2)-0.5)<1e-14;
X(mask2,2) = -0.5; 

% Initialisation
plan=nfft(2,N,length(X(:,1))); % create plan of class type nfft
%n=2^(ceil(log(max(N))/log(2))+1);
%plan=nfft(2,N,M,n,n,7,'PRE_PHI_HUT','FFTW_MEASURE'); % use of nfft_init_guru
plan.x=X; % set nodes in plan
nfft_precompute_psi(plan); % precomputations
% NFFT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


fhatv=fhat(1:end-1,1:end-1)';

% Compute samples with NFFT
plan.fhat=fhatv(:); % set Fourier coefficients
nfft_trafo(plan); % compute nonequispaced Fourier transform
zz=reshape(plan.f,size(y)); % get samples

if realvals 
    zz = real(zz);
end
