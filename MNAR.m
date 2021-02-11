function Indata_N = MNAR(data, ratio, distribution, Numf)
% Output incomplete datasets with MNAR
% Copyright 2021 Roozbeh Razavi-Far

[instance, feature] = size(data);
MPcase = CellTCase(ratio, Numf, instance, feature);

%% Create several subsets
K = decifreq(data);
freq(1 : K) = 1 / K;
[Candp,index] = D_data(data, freq);
Indata_N = data;

%% Create missing patterns and weights
patterns = RandbuildMF(K, feature, Numf);

%% Apply distributions and select missing samples

for i = 1:length(freq)
    MFP = find(patterns(i, :) == 0);
    Indata_N = createNAN(Indata_N, Candp{i}, index{i}, MPcase, MFP, distribution);
end
end
