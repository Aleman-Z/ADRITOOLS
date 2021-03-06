
function [z]=merge_mat(x,y)
%[z]=merge_mat(x,y)
%Concatenates matrices with different dimensions.
    sx = size(x);
    sy = size(y);
    a = max(sx(1),sy(1));
    z = [[x;zeros(abs([a 0]-sx))],[y;zeros(abs([a,0]-sy))]];
end