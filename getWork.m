function work = getWork(To4, To5, mdot, isVarK)

work = 0;

if isVarK
    dT = 1e-2;
    for T = To5:dT:To4
        [cp,~,~] = specHeat(T);
        work = work + cp*dT;
    end
    work = mdot * work;
else
    cp = const.Cp;
    work = mdot*cp*(To4 - To5);
end

end