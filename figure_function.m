function figure_function(h,destFolder,filename,x_plots)

    if (~isempty(x_plots))
    default = get(h,'defaultfigureposition');
    set(h,'Position',[default(1:2) x_plots/1.84*default(3) default(4)]);
    end

    set(h,'Units','Inches');

    pos = get(h,'Position');
    set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3) pos(4)]);
    print('-painters',h,filename,'-dpdf','-r0');

    if (~isempty(destFolder)) % if is not empty
    movefile(filename, destFolder);
    end
end