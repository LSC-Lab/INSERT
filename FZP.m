function P = FZP(array)
% Select causitive feature
for i = 1:length(array)
    if array(i) == 0
        P = i;
        break
    end
end

end
