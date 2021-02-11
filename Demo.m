% Copyright 2021 Roozbeh Razavi-Far

close all;
clear;
clc;

%% Inputs

filename  = 'Iris';  % Excel data
max_ratio = 0.1;  % Maximum missing ratio
mechanism = {'MCAR', 'MAR', 'MNAR'};  % Missing mechanism
distribution = {'exponential', 'normal', 'logistic', 'weibull',...
    'InverseGaussian'};  % Missing distribution
Numf = 3;  % Number of missing feature
labeled = true;  % If the data has labels in the last column

%% Inducing missing data

for i = 0.5 : 0.5 : max_ratio * 10
    INSERT(filename, i * 0.1, mechanism{1}, distribution{1}, Numf, labeled);
    for j = 2 : length(distribution)
        INSERT(filename, i * 0.1, mechanism{2}, distribution{j}, Numf, labeled);
        INSERT(filename, i * 0.1, mechanism{3}, distribution{j}, Numf, labeled);
    end
end
