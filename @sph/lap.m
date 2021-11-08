function f = lap(f,pc)

if nargin == 1
    pc = precomGrad(f);
end

[fx,fy,fz] = grad(f,pc);
f = div(fx,fy,fz,pc);