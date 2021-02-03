function createIndata(data, filename, mechanism, ratio, distribution)
% Export incomplete datasets

switch mechanism
    case 'MCAR'
        ratio = ratio * 100;
        ratio = num2str(ratio);
        ratio = (['_', ratio, '%']);
        M = '_C';
        xlswrite([pwd, '\', filename, M, ratio, '.xlsx'], data);
    case 'MAR'
        name = abbdist(distribution);
        ratio = ratio * 100;
        ratio = num2str(ratio);
        ratio = (['_', ratio, '%']);
        M = '_A';
        xlswrite([pwd, '\', filename, M, name, ratio, '.xlsx'], data);
    case 'MNAR'
        name = abbdist(distribution);
        ratio = ratio * 100;
        ratio = num2str(ratio);
        ratio = (['_', ratio, '%']);
        M = '_N';
        xlswrite([pwd, '\', filename, M, name, ratio, '.xlsx'], data);
    otherwise
        disp('its not a correct mechanism');
end
end