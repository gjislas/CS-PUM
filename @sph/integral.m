function I = integral(f)

I = 0;
for k = 1:6
    I = I + integral(f.subdom{k});
end