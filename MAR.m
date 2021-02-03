function Indata_A = MAR(data, ratio, distribution, Numf)
% Output incomplete datasets with MAR
[instance,feature] = size(data);
MPcase = CellTCase(ratio, Numf, instance, feature); % How many cases will be missed

%% Create several subsets
K = decifreq(data);
freq(1 : K) = 1 / K;
[Candp,index] = D_data(data, freq);
Indata_A = data;
patterns(1 : K, 1 : feature) = 0;

%% Create missing patterns and weights

for i = 1 : K
    patterns(i, :) = BMP(Candp{i}, Numf);
end
weights = patterns;

%% Apply distributions and select missing samples
for i = 1:length(freq)
    MFP{i} = find(patterns(i, :) == 0);
    Wss{i} = sum(Candp{i}.*weights(i, :), 2);
    Wss{i} = abs(normalize(Wss{i})) + 0.001;
    pd{i} = fitdist(Wss{i}, distribution);
    MPC{i} = cdf(pd{i}, Wss{i});
    MPC{i} = normalize(MPC{i}, 'norm', 1);
    LL{i} = length(MPC{i});
    SL{i} = floor(LL{i} * MPcase);
    MCD{i} = WRS1(LL{i}, SL{i}, MPC{i});
    MC{i} = index{i}(MCD{i});
    Indata_A(MC{i}, MFP{i}) = nan;
end
end