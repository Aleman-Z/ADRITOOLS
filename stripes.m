function stripes(input,a,time)
if nargin>2
    rrc=area(time,input,'FaceColor','none');
    alpha(a)
end

if nargin==2
    rrc=area(input,'FaceColor','none');
    alpha(a)
end

if nargin==1
    rrc=area(input,'FaceColor','none');
    alpha(0.5)
end
set(rrc, 'FaceColor', 'r');
end