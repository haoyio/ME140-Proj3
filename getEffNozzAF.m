function eff = getEffNozzAF(To1, Po1, To2, v2, P2, isVarK, mdot_air, mdot_fuel)

if isVarK
    R = const.R;
    
    % Get T2s from isentropic relations
    dT = -1e-2;
    T2s = To1;
    LHS = 0;
    RHS = R*log(P2/Po1);
    while LHS > RHS
        [cp,~,~] = specHeatC123H222(mdot_air/mdot_fuel, T2s);
        LHS = LHS + cp/T2s*dT;
        T2s = T2s + dT;
    end
    
    Po2s = Po1;
    [~,~,k] = specHeatC123H222(mdot_air/mdot_fuel, T2s);
    M2s = (2/(k-1)*((Po2s/P2)^((k-1)/k) - 1))^0.5;  % isentropic relations
    
    %{
    % Get M2s
    dT = 1e-2;
    RHS = 0;
    for T = T2s:dT:To2
        [cp,~,~] = specHeat(T);
        RHS = RHS + cp*dT;
    end
    
    [~,~,k] = specHeat(T2s);
    M2s = sqrt( RHS/(1/2*k*R*T2s) );
    %}
    
    % Get v2s
    c2s = sqrt(k*R*T2s);
    v2s = M2s*c2s;
    
    % Compute efficiency
    eff = v2^2/v2s^2;
    
else
    k = const.k;
    R = const.R;
    
    Po2s = Po1;         % nozzle T-s diagram
    
    M2s = (2/(k-1)*((Po2s/P2)^((k-1)/k) - 1))^0.5;  % isentropic relations
    T2s = To2 / ((1 + (k-1)/2*M2s^2));              % "
    
    c2s = sqrt(k*R*T2s);        % speed of sound relation
    v2s = M2s*c2s;              % definition of Mach number
    
    eff = v2^2/v2s^2;
end

end