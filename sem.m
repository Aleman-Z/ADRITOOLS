function [standard_error]=sem(x)
    standard_error=nanstd(x)/sqrt( length(x(~isnan(x))));
end