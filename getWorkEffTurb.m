function [work, eff] = getWorkEffTurb(To4, Po4, To5, Po5, mdot, isVarK)

% Returns actual work consumed by turbine (extensive)
% and turbine adiabatic efficiency

work = getWork(To4, To5, mdot, isVarK);
eff = getEff(To4, Po4, Po5, work/mdot, isVarK);

end

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

function eff = getEff(To4, Po4, Po5, work, isVarK)

eff = 0;
R = const.R;

if isVarK
    % Compute To5s
    RHS = R*log(Po5/Po4);
    LHS = 0;
    dT = -1e-2;
    To5s = To4;
    while LHS > RHS
        [cp,~,~] = specHeat(To5s);
        LHS = LHS + cp/To5s*dT;
        To5s = To5s + dT;
    end
    
    % Compute work assuming isentropic process
    works = 0;
    dT = 1e-2;
    for T = To5s:dT:To4
        [cp,~,~] = specHeat(T);
        works = works + cp*dT;
    end
    
    % Compute figure of merit
    eff = work/works;
else
    cp = const.Cp;
    k = const.k;
    
    % Compute To5s
    To5s = To4*(Po5/Po4)^((k-1)/k);
    works = cp*(To4 - To5s);
    
    eff = work/works;
end

end