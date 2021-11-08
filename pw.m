function [W,d] = pw(lam)
% Partition of the unit window

alpha = -log(0.3)/(pi/4)^(2*lam);
d = 10^((log10(14)-log10(alpha)-log10(log10(exp(1))))/(2*lam));

w = @(t,p) exp(-alpha*(t.^(2*lam)+p.^(2*lam)));
s = @(t,p) w(t,p)+w(t+pi/2,p)+w(t-pi/2,p)+w(t,p-pi/2)+w(t,p+pi/2);
W = @(t,p) w(t,p)./s(t,p);