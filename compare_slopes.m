function [p,z]=compare_slopes(x1,x2,y1,y2)

r1 = corr(x1(:), y1(:));
r2 = corr(x2(:), y2(:));
n1 = length(x1);
n2 = length(x2);

[p, z] = corr_rtest(r1, r2, n1, n2);

end