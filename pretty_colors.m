function pretty_colors
    colors = cbrewer('div', 'RdBu', 64);
    colors = flipud(colors); % puts red on top, blue at the bottom
    colormap(colors);
end

