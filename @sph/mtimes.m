function f = mtimes(s,f)

for k =1:6
    f.subdom{k} = mtimes(s,f.subdom{k});
end
