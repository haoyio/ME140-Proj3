function [work, eff] = getWorkEffComp(To2, Po2, To3, Po3, mdot, isVarK)

% Returns actual work consumed by compressor (extensive)
% and compressor adiabatic efficiency

work = getWork(To2, To3, mdot, isVarK);
eff = getEff(To2, Po2, Po3, work/mdot, isVarK);

end

function work = getWork(To2, To3, mdot, isVarK)

work = 0;

if isVarK
    dT = 1e-2;
    for T = To2:dT:To3
        [cp,~,~] = specHeat(T);
        work = work + cp*dT;
    end
    work = mdot * work;
else
    cp = const.Cp;
    work = mdot*cp*(To3 - To2);
end

end

function eff = getEff(To2, Po2, Po3, work, isVarK)

eff = 0;
R = const.R;

if isVarK
    % Compute To3s
    RHS = R*log(Po3/Po2);
    LHS = 0;
    dT = 1e-2;
    To3s = To2;
    while LHS < RHS
        [cp,~,~] = specHeat(To3s);
        LHS = LHS + cp/To3s*dT;
        To3s = To3s + dT;
    end
    
    % Compute work assuming isentropic process
    works = 0;
    dT = 1e-2;
    for T = To2:dT:To3s
        [cp,~,~] = specHeat(T);
        works = works + cp*dT;
    end
    
    % Compute figure of merit
    eff = works/work;
else
    cp = const.Cp;
    k = const.k;
    
    % Compute To3s
    To3s = To2*(Po3/Po2)^((k-1)/k);
    works = cp*(To3s - To2);
    
    eff = works/work;
end

end