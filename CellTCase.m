function MPcase = CellTCase(prop, MF, instance, feature)
% Number of missing samples
% Copyright 2021 Roozbeh Razavi-Far

if MF < 1
    error('NUmber of missing features must greater than one')
end

TMN = instance * feature * prop;
MPcase = TMN / MF / instance;
end
