function [h]=add_legend(g,myColorMap)
%add_legend(g,myColorMap)
%g
%myColorMap

    L = line(nan(length(g.')), nan(length(g.')),'LineStyle','none'); % 'nan' creates 'invisible' data
    set(L, {'MarkerEdgeColor'}, num2cell(myColorMap, 2),...
        {'MarkerFaceColor'},num2cell(myColorMap, 2),... % setting the markers to filled squares
        'Marker','s'); 

    h=legend(L, g.')
    
end