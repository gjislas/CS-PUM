function f = times(f,g)

for k =1:6
    f.subdom{k} = times(f.subdom{k},g.subdom{k});
end
