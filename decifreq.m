function freq = decifreq(data)
% Decide the number of subsets for incomplete datasets
% Copyright 2021 Roozbeh Razavi-Far

[instance, feature] = size(data);
freq = feature;

while freq > 2
    k = instance / freq / feature;
    if k < 2.5
        freq = freq - 1;
    else
        break
    end
end
end
