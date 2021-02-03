function In_dataP = RPdata(In_data, gn, F)
% Create categorical datasets

[m, n] = size(In_data);

for i = 1 : n
    if F(i) == 1
        for j = 1:m
            if ~isnan(In_data(j, i))
                In_dataP{j, i} = gn{1, i}{In_data(j, i), 1};
            end
        end
    else
        for j = 1 : m
            In_dataP{j, i} = In_data(j, i);
        end
    end
end
end