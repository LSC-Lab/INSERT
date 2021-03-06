function sampleincompleteness(data)
% Judge if all samples contain missing values
% Copyright 2021 Roozbeh Razavi-Far

t = isnan(data);
t = 1 - t;
k = prod(t, 2);
kk = ismember(k, 1);
ff = sum(kk);

if ff == 0
    warning('all samples contain missing values')
end
end
