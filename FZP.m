function P = FZP(array)
% Select causitive feature
% Copyright 2021 Roozbeh Razavi-Far

for i = 1:length(array)
    if array(i) == 0
        P = i;
        break
    end
end

end
