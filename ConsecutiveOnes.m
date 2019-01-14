
function v2=ConsecutiveOnes(v)

    v2 = zeros(size(v)); % Initialize vector of same length.
    props = regionprops(logical(v), 'Area', 'PixelIdxList');
    for k = 1 : length(props)
      v2(props(k).PixelIdxList(1)) = props(k).Area;
    end

end