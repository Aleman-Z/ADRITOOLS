function im(o2,varargin)
o2((o2)==0)=NaN;
varargin;
    if length(varargin)~=0
    J=imagesc(varargin{1},varargin{2},o2);colormap(jet(256)); colorbar()
    set(J,'AlphaData',~isnan(o2))
    set(gca,'YDir','normal')
    else
    % figure()
    J=imagesc(o2);colormap(jet(256)); colorbar()
    set(J,'AlphaData',~isnan(o2))
    set(gca,'YDir','normal')
    end
end