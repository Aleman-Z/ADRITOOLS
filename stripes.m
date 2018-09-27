function stripes(input,a,time)
if nargin>2
    rrc=area(time,input,'FaceColor','none');
else
    rrc=area(input,'FaceColor','none');
end
set(rrc, 'FaceColor', 'r');
alpha(a)
end