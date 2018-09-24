function boxplotnout(gr1)
bbb=boxplot(gr1); 
set(bbb(7,:),'Visible','off');

ylim auto
end