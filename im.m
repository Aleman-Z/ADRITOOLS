function im(o2)
o2((o2)==0)=NaN;
J=imagesc(o2);colormap(jet(256)); colorbar()
set(J,'AlphaData',~isnan(o2))
end