function f = div(F,G,H,pc)
 
if nargin == 1 || nargin == 2
    if nargin == 2
        pc = G;
    end
   G = F(2); H = F(3); F = F(1);
end
if nargin == 1 || nargin == 3
   pc = precomGrad(F);
end

[fx,~,~] = grad(F,pc);
[~,gy,~] = grad(G,pc);
[~,~,hz] = grad(H,pc);

f = fx+gy+hz;
end