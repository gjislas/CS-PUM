function f = prolong(f, Nx, Ny)

% Nothing to do cases
if f.nx == Nx && f.ny == Ny
    return
end
powerNx = log2(Nx);
powerNy = log2(Ny);
if round(powerNx) ~= powerNx
    error('fourier2:prolong:input','Nx must be a power of 2');
elseif round(powerNy) ~= powerNy
    error('fourier2:prolong:input','Ny must be a power of 2');
end
    
% Pad coeffs with zeros if needed
if f.nx < Nx || f.ny < Ny
    fhat = fft2(f.vals);
    if f.nx < Nx
        %Pad in x-direction
        npad = Nx - f.nx - 1; % Notice that the last mode gets repeated V_{-N/2} = V_{N/2}
        fhat = [fhat(:,1:f.nx/2+1) zeros(f.ny,npad) fhat(:,f.nx/2+1:end)];
    end
    if f.ny < Ny
        %Pad in y-direction
        npad = Ny - f.ny - 1;
        fhat = [fhat(1:f.ny/2+1,:); zeros(npad,max(f.nx,Nx)); fhat(f.ny/2+1:end,:)];
    end
    f.vals = ifft2(fhat)*(Nx*Ny/(f.nx*f.ny));
    [f.ny, f.nx] = size(f.vals); 
end

% Trim if needed
if f.nx > Nx
    % Trim in the x-direction 
    % This assumes both f.nx and Nx are powers of two
    skip = 2^(log2(f.nx)-powerNx);
    f.vals = f.vals(:,1:skip:end);
    f.nx =  Nx;
end
if f.ny > Ny
    % Trim in the y-direction 
    % This assumes both f.ny and Ny are powers of two
    skip = 2^(log2(f.ny)-powerNy);
    f.vals = f.vals(1:skip:end,:);
    f.ny =  Ny;
end


