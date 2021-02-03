function MCD = WRS1(LL,SL,MPC)
% Probability random select missing samples for each missing pattern

MCD(1:SL) = 0;

for i = 1 : SL
    kk = randsample(LL,1,true,MPC);
    MCD(i) = kk;
    MPC(kk) = 0;
end
end

