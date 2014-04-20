function [P, Po, M, V, T, To] = station4AF(mdot_air, mdot_fuel, A, Tm, P, RF)
% Iterative procedure to determine MFP, To, M, and T

M = 0;
T = 0;
To = Tm;
Po = P;
[~,~,k] = specHeatC123H222(mdot_air/mdot_fuel, Tm);

while(true)
    while(true)
        MFP = (mdot_air+mdot_fuel)/A*sqrt(const.R*To)/Po;
        M = fsolve( @(M) M*sqrt(k)*(1+(k-1)/2*M^2)^...
            (-(k+1)/(2*(k-1))) - MFP,[0.5],...
            optimset('Display','off'));
        Po_P = (1+(k-1)/2*M^2)^((k-1)/k);
        Po_new = Po_P * P;
        if( abs((Po_new-Po)/Po) < 1e8 )
            break;
        end
    end
    To_Tm = (1+(k-1)/2*M^2)/(1+RF*(k-1)/2*M^2);
    To_new = To_Tm * Tm;
    if( abs((To_new-To)/To) < 1e8 )
        break;
    end
end

[~,~,k] = specHeatC123H222(mdot_air/mdot_fuel, Tm);
T = Tm / (1+RF*(k-1)/2*M^2);
V = M * sqrt(k*const.R*T);

end