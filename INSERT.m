function INSERT(filename, ratio, mechanism, distribution, Numf, labeled)
% Copyright 2021 Roozbeh Razavi-Far

%% Input
% filename: filename of original complete data
% ratio: Missing ratio (0~1)
% mechanism: Missing mechanism (MCAR, MAR, MNAR)
% distribution: Missing distribution ('exponential','normal','logistic','weibull','InverseGaussian')
% Numf: Number of missing feature for MAR and MNAR

%% Output

% Incomplete data with input ratio mechanism and distribution
% The first letter in the output file
% C: MCAR
% A: MAR
% N: MNAR

% The second letter in the output file
% N: Normal
% E: Exponential
% L: logistic
% W: Weibull;
% G: InverseGaussian

%% Import data
dataset = readtable([filename, '.xlsx'], 'ReadVariableNames', false);
dataset = table2cell(dataset);
f = size(dataset, 2);
feature = f - 1;

if labeled
    data = dataset(:, 1 : feature);
    label = dataset(:, f);
else
    data = dataset;
end

if feature * ratio > Numf
    error('Cannot reach this missing ratios with this number of missing features!')
end


%% Process categorical data

for i = 1:feature
    if ischar(data{1,i})
        [dataP(:, i), gn{i}, ~] = grp2idx(data(:, i));
        F(i) = 1;
    else
        dataP(:, i) = cell2mat(data(:, i));
        F(i) = 0;
    end
end

%% Create incomplete dataset

switch mechanism
    case 'MCAR'
        In_data = MCAR(dataP, ratio);
        distribution = 'nan';
    case 'MAR'
        In_data = MAR(dataP, ratio, distribution, Numf);
    case 'MNAR'
        In_data = MNAR(dataP, ratio, distribution, Numf);
    otherwise
        error('Not a correct Mechanism');
end

sampleincompleteness(In_data);

%% Create categorical features
if F == 0
    In_dataP = num2cell(In_data);
else
    In_dataP = RPdata(In_data, gn, F);
end

if labeled
    Indata = [In_dataP label];
else
    Indata = In_dataP;
end

%% Output the incomplete data in current folder
createIndata(Indata, filename, mechanism, ratio, distribution);

end
