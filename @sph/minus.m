function f = minus(f,g)

for k =1:6
    f.subdom{k} = f.subdom{k} - g.subdom{k};
end