function Indata_C = MCAR(data,ratio)
% Output incomplete datasets with MCAR
% Copyright 2021 Roozbeh Razavi-Far

[instance, feature] = size(data);
Tdata = instance * feature;
dataset = data(:, 1 : feature);
M = floor(Tdata * ratio);
N = 0;
while N < M
    x = randi(instance);
    y = randi(feature);
    if ~isnan(dataset(x, y))
        dataset(x, y) = nan;
        N = N + 1;
    else
        continue
    end
end
Indata_C = dataset;
end
