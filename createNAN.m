function Idata = createNAN(Idata, Candp, index, MPcase, MFP, distname)
% Creating missing values in missing samples for each missing pattern

LL = size(Candp, 1);
SL = floor(LL * MPcase);

for i = 1:length(MFP)
    k = Candp(:, MFP(i));
    FF = unique(k);
    pp = length(FF);
    if pp < 4
        MCD = randperm(LL, SL);
        MC = index(MCD);
        Idata(MC, MFP(i)) = nan;
    else
        W = abs(normalize(k)) + 0.001;
        pd = fitdist(W, distname);
        MPC = cdf(pd, W);
        MPC = normalize(MPC, 'norm', 1);
        MCD = WRS1(LL, SL, MPC);
        MC = index(MCD);
        Idata(MC, MFP(i)) = nan;
    end
end