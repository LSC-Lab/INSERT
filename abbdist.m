function name = abbdist(distname)
% Abreviation for the distribuitions

switch distname
    case 'exponential'
        name = 'E';
    case 'normal'
        name = 'N';
    case 'logistic'
        name = 'L';
    case 'weibull'
        name = 'W';
    case 'InverseGaussian'
        name = 'G';
    otherwise
        disp('Its not a correct distribution name');
end
end

