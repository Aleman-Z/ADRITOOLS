function [B]=remove_nan(B)
B=B(~isnan(B));

end