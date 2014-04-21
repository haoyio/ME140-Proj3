function eff = getEffComb(To1,To2,isVarK,mdot_air,mdot_fuel)

if ~isVarK
    dT = 1e-2;
    delta_h = 0;
    for T = To1:dT:To2          % enthalpy change from To1 to To2
        [cp,~,~] = specHeatC123H222(mdot_air, mdot_fuel, T);
        delta_h = delta_h + cp*dT;
    end
else
    cp = const.Cp;
    delta_h = cp*(To2-To1);     % enthalpy change from To1 to To2
end

enthalpy_power = mdot_air*delta_h;
Qin = mdot_fuel*const.LHV;
eff = enthalpy_power / Qin;   % efficiency definition

end