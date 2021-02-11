function MP = BMP(data, MF)
% Build missing pattern based on correlation coefficient
% Copyright 2021 Roozbeh Razavi-Far

[~, f] = size(data);
feature = f;

AV = MF;
Indata_A = data(:, 1 : feature);
kk = 0;

while kk < MF
    R = abs(corrcoef(Indata_A));
    for i = 1 : feature
        R(i, i) = nan;
    end
    nf(AV, 2) = 0;
    for i = 1:AV
        [~, I] = max(R(:));
        [a, b] = ind2sub(size(R), I);
        nf(i, 1) = a; nf(i, 2) = b;
        R(a, b) = nan; R(b, a) = nan;
    end

    table = tabulate(nf(:));
    [~, ii]=sort(table(:, 2), 'descend');
    isize = size(ii, 1);
    DV(1 : isize, 1 : feature) = 0;
    DV(:, 1) = ii;
    for i = 1 : AV
        for j = 1 : 2
            nR(i, j) = find(ii == nf(i, j));
        end
    end
    for i = 1 : AV
        if nR(i, 1) > nR(i, 2)
            P = FZP(DV(nR(i, 2), :));
            DV(nR(i, 2), P) = ii(nR(i, 1));
        else
            P = FZP(DV(nR(i, 1), :));
            DV(nR(i, 1), P) = ii(nR(i, 2));
        end
    end
    ff = unique(DV(:, 2 : end));
    kk = length(unique(DV(:, 2 : end))) - 1;
    AV = AV + 1;
end

FS = ff(2 : end);
MP(1 : feature) = 1;
MP(FS) = 0;
end
