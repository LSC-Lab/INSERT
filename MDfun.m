function Indata = MDfun(filename, mechanism, MDP, distname)
% Main function for outputing labeled datasets
% Copyright 2021 Roozbeh Razavi-Far

dataset = readtable([filename, '.xlsx'], 'ReadVariableNames', false);
dataset = table2cell(dataset);
f = size(dataset, 2);
feature = f - 1;
data = dataset(:,1 : feature);
label = dataset(:, f);

switch MDP
    case 0.01
        MF = 0.25;
    case 0.05
        MF = 0.25;
    case 0.10
        MF = 0.5;
    case 0.20
        MF = 0.5;
    otherwise
        disp('incorrect MDP');
end

for i = 1 : feature
    if ischar(data{1, i})
        [dataP(:, i), gn{i}, ~] = grp2idx(data(:, i));
        F(i) = 1;
    else
        dataP(:, i) = cell2mat(data(:, i));
        F(i) = 0;
    end
end

In_data = Generatemissing(dataP, mechanism, MDP, MF, distname);
if F == 0
    In_dataP = num2cell(In_data);
else
    In_dataP = RPdata(In_data, gn, F);
end

Indata = [In_dataP label];
PP = CalMissingrate(In_data);
createIndata(Indata, filename, mechanism, MDP, MF, distname);
end
