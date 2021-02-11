function Patterns = RandbuildMF(K, feature, MF)
% Build missing features for MNAR
% Copyright 2021 Roozbeh Razavi-Far

Patterns(1 : K, 1 : feature) = 1;

for i = 1 : K
    ind = randperm(feature, MF);
    Patterns(i, ind) = 0;
end
end
