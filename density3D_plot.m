function [scatter_COL] = density3D_plot(X,Y,Z)

% Input X, Y, & Z must be arrays.

% TOOLBOX required - histcn!
% https://www.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/23897/versions/4/previews/histcn.m/index.html


        data = [X,Y,Z];

        numbins = 125;  % change numbin HERE
        markersize = 10;
        marker = 'o';
        plot_colorbar = 1;
        plot_lsf = 1;

    %% values
    %[values, centers] = hist3([X Y], [numbins numbins]); 
    [values centers mid loc] = histcn(data);
    values = values/size(X,1); % to produce density

    centers_X = centers{1,1};
    centers_Y = centers{1,2};
    centers_Z = centers{1,3};

    binsize_X = abs(centers_X(2) - centers_X(1)) / 2;
    binsize_Y = abs(centers_Y(2) - centers_Y(1)) / 2;
    binsize_Z = abs(centers_Z(2) - centers_Z(1)) / 2;
    bins_X = zeros(numbins, 2);
    bins_Y = zeros(numbins, 2);
    bins_Z = zeros(numbins, 2);

    for i = 1:numbins
        bins_X(i, 1) = centers_X(i) - binsize_X;
        bins_X(i, 2) = centers_X(i) + binsize_X;
        bins_Y(i, 1) = centers_Y(i) - binsize_Y;
        bins_Y(i, 2) = centers_Y(i) + binsize_Y;
        bins_Z(i, 1) = centers_Z(i) - binsize_Z;
        bins_Z(i, 2) = centers_Z(i) + binsize_Z;
    end

    scatter_COL = zeros(length(X), 1);

    onepercent = round(length(X) / 100);
    
    fprintf('Generating colormap...\n');
    
    for i = 1:length(X)

        if (mod(i,onepercent) == 0)
            fprintf('.');
        end            

        last_lower_X = NaN;
        last_higher_X = NaN;
        id_X = NaN;

        c_X = X(i);
        last_lower_X = find(c_X >= bins_X(:,1));
        if (~isempty(last_lower_X))
            last_lower_X = last_lower_X(end);
        else
            last_higher_X = find(c_X <= bins_X(:,2));
            if (~isempty(last_higher_X))
                last_higher_X = last_higher_X(1);
            end
        end
        if (~isnan(last_lower_X))
            id_X = last_lower_X;
        else
            if (~isnan(last_higher_X))
                id_X = last_higher_X;
            end
        end

        last_lower_Y = NaN;
        last_higher_Y = NaN;
        id_Y = NaN;

        c_Y = Y(i);
        last_lower_Y = find(c_Y >= bins_Y(:,1));
        if (~isempty(last_lower_Y))
            last_lower_Y = last_lower_Y(end);
        else
            last_higher_Y = find(c_Y <= bins_Y(:,2));
            if (~isempty(last_higher_Y))
                last_higher_Y = last_higher_Y(1);
            end
        end
        if (~isnan(last_lower_Y))
            id_Y = last_lower_Y;
        else
            if (~isnan(last_higher_Y))
                id_Y = last_higher_Y;
            end
        end

        last_lower_Z = NaN;
        last_higher_Z = NaN;
        id_Z = NaN;

        c_Z = Z(i);
        last_lower_Z = find(c_Z >= bins_Z(:,1));
        if (~isempty(last_lower_Z))
            last_lower_Z = last_lower_Z(end);
        else
            last_higher_Z = find(c_Z <= bins_Z(:,2));
            if (~isempty(last_higher_Z))
                last_higher_Z = last_higher_Z(1);
            end
        end
        if (~isnan(last_lower_Z))
            id_Z = last_lower_Z;
        else
            if (~isnan(last_higher_Z))
                id_Z = last_higher_Z;
            end
        end

        scatter_COL(i) = values(id_X, id_Y, id_Z); 
    
    end

  
    %% Plotting 
    f = figure();
    scatter3(X,Y,Z, markersize, scatter_COL, marker);
    hold on
    colormap("hot");


end

