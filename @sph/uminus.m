function f = uminus(f)

for k =1:6
    f.subdom{k} = -f.subdom{k};
end