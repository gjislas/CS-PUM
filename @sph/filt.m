function f = filt(f,eta,rho)

for k = 1:6
    f.subdom{k} = filt(f.subdom{k},eta,rho);
end