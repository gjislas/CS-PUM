function varargout = subsref(f,index)
% SUBSREF(F,INDEX) allows for standard function references, i.e. F(x) and returns function value
% of fourfun F at vector X. Additionally, allows for references to F.NX, F.VALS, 
% F.SCL, and F.MAP.FOR, F.MAP.INV, etc.  

idx = index(1).subs;

switch index(1).type
    case '()'
        if length(idx) == 1
            varargout = {f(1,idx{1})};
        else
            x = idx{1};
            y = idx{2};
            z = idx{3};
            if isnumeric(x)
                varargout = { feval(f,x,y,z) };
            else
                error('Fourfun: subsref: input: cannot evaluate sph for non-numeric type');
            end
        end
    case '.'
        varargout = {builtin('subsref',f,index)};
end
end

