function F = feval(g,x,y,z)


F = 0*x;
for k = 1:6
    F = F+feval(g.subdom{k},x,y,z);
end