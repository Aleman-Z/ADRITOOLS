function [ww]=ex
w=findobj(gcf,'Type','image');
ww=get(w,'cdata'); 
end