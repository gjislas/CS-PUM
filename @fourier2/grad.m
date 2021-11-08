function [dxvals,dyvals] = grad(f,nnx,nny)
% diff(f,nderx,ndery)

% Default input arguments

yhat = fft2(f.vals); 

dxyhat = (nnx).*yhat;
dyyhat = (nny).*yhat;

dxyhat(:,f.nx/2+1) = 0;
dyyhat(f.ny/2+1) = 0;


dxvals = ifft2(dxyhat);

dyvals = ifft2(dyyhat);

% Chain rule for scalled domains
dxvals = (2*pi/diff(f.map.par(1:2)))*dxvals;
dyvals = (2*pi/diff(f.map.par(3:4)))*dyvals;

if isreal(f.vals)
    dxvals = real(dxvals);
elseif isreal(1i*f.vals)
    dxvals = 1i*imag(dxvals);
end
    
if isreal(f.vals)
    dyvals = real(dyvals);
elseif isreal(1i*f.vals)
    dyvals = 1i*imag(dyvals);
end

