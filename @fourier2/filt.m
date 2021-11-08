function f = filt(f,eta,p)

yhat = fft2(f.vals); N = f.nx;

%threshold for modes filtered out (k < cN = 1)
N_th = round(N*(1-eta)/2)+1;
c = eta/2;

[kx,~] = meshgrid(-N/2:N/2-1);
expfilter = exp(log(eps)*((2/N*abs(kx)-c)/(1-c)).^p);
expfilter(:,N_th:N-N_th) = ones(N,N-2*N_th+1);
expfilter = expfilter'.*expfilter;

f.vals = ifft2(fftshift(expfilter).*yhat);
end



