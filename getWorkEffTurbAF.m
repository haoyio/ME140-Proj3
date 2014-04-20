function [work, eff] = getWorkEffTurbAF(To4, Po4, To5, Po5, mdot_air, mdot_fuel, isVarK)

% Returns actual work consumed by turbine (extensive)
% and turbine adiabatic efficiency

work = getWork(To4, To5, mdot_air, mdot_fuel, isVarK);
eff = getEff(To4, Po4, Po5, work/(mdot_air+mdot_fuel), isVarK, mdot_air, mdot_fuel);

end

function work = getWork(To4, To5, mdot_air, mdot_fuel, isVarK)

work = 0;

if isVarK
    dT = 1e-2;
    for T = To5:dT:To4
        [cp,~,~] = specHeatC123H222(mdot_air/mdot_fuel,T);
        work = work + cp*dT;
    end
    work = (mdot_air+mdot_fuel) * work;
else
    cp = const.Cp;
    work = (mdot_air+mdot_fuel)*cp*(To4 - To5);
end

end

function eff = getEff(To4, Po4, Po5, work, isVarK, mdot_air, mdot_fuel)

R = const.R;

if isVarK
    % Compute To5s
    RHS = R*log(Po5/Po4);
    LHS = 0;
    dT = -1e-2;
    To5s = To4;
    while LHS > RHS
        [cp,~,~] = specHeatC123H222(mdot_air/mdot_fuel,To5s);
        LHS = LHS + cp/To5s*dT;
        To5s = To5s + dT;
    end
    
    % Compute work assuming isentropic process
    works = 0;
    dT = 1e-2;
    for T = To5s:dT:To4
        [cp,~,~] = specHeatC123H222(mdot_air/mdot_fuel,T);
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