function stripes(input,a,time,colour)
%stripes(input,a,time)
%Plots binary data as stripes.
%Optional inputs:
%a: Alpha value of transparency.
%time: time stamps. 
if nargin==4
    rrc=area(time,input,'FaceColor','none');
    alpha(a)
    set(rrc, 'FaceColor',colour);
end


if nargin==3
    rrc=area(time,input,'FaceColor','none');
    alpha(a)
    set(rrc, 'FaceColor', 'r');
end

if nargin==2
    rrc=area(input,'FaceColor','none');
    alpha(a)
    set(rrc, 'FaceColor', 'r');
end

if nargin==1
    rrc=area(input,'FaceColor','none');
    alpha(0.5)
    set(rrc, 'FaceColor', 'r');
end

end