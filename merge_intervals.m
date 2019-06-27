function [y]=merge_intervals(x)
%[y]=merge_intervals(x)

% Nx2 matrix of endpoints x1, x2 of intervals
%x = [8 10; 2 4; 4 5; 5 7; 9 11; 15 16; 14 17; 10 12]
nrow = size(x,1); 

% -----plot it first
% nline  = repmat((1:size(x,1))',1,2);
% plot(x',nline','o-')
% ylim([-.5*nrow 1.5*nrow])


% ----- find union of intervals
x = sort(x,2);
[x ind] = sort(x(:));
n = [(1:nrow) (1:nrow)]';
n = n(ind);
c = [ones(1,nrow) -ones(1,nrow)]';
c = c(ind);
csc = cumsum(c);          % =0 at upper end of new interval(s)
irit = find(csc==0);
ilef = [1; irit+1];
ilef(end) = [];           % no new interval starting at the very end 
% y matrix is start and end points of the new intervals, y1,y2
%
% ny matrix is the corresponding indices of the start and end points
% in terms of what row of x they occurred in.
   y = [x(ilef) x(irit)];
  ny = [n(ilef) n(irit)];
    
end