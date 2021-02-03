function [Candp, index] = D_data(data, freq)
% Divide datasets into several subsets
instance = size(data, 1);
ind = [1 : 1 : instance]';
data_i = [ind data];
k = length(freq);
freqnum = floor(freq * instance);
if sum(freqnum) ~= instance
    freqnum(k) = instance - (sum(freqnum(1 : (k - 1))));
end


for i = 1 : k
    inst = size(data_i, 1);
    R = randperm(inst, freqnum(i));
    Candp{i} = data_i(R, 2 : end);
    index{i} = data_i(R, 1);
    data_i(R, :) = [];
end
end