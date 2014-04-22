function [cp, cv, k] = specHeatC12H26(AF, T)

% 
% Returns dodecane-air fuel mixture specific heats (see eqn below)
%
% phi*C12H26 + 18.5*(O2 + 3.76*N2) -> 
%   12*phi*CO2 + 13*phi*H2O + (3.76*18.5)*N2 + 18.5*(1-phi)*O2
% 

% Compute mass fractions
AF_stoich = 18.5*(const.M_O2 + ...      % stoichometric air-fuel ratio
            3.76*const.M_N2)/const.M_C12H26;
phi = AF_stoich/AF;                     % equivalence ratio


M_total = 12*phi + 13*phi + 3.76*18.5 + 18.5*(1-phi);
MF_CO2 = 12*phi/M_total;                % molar fraction CO2
MF_H2O = 13*phi/M_total;                % molar fraction H2O
MF_N2 = 3.76*18.5/M_total;              % molar fraction N2
MF_O2 = 18.5*(1-phi)/M_total;           % molar fraction O2
MF = [MF_CO2 MF_H2O MF_N2 MF_O2]';      % molar fractions
=======
MF_CO2 = 12*phi*const.M_CO2;            % mass fraction CO2
MF_H2O = 13*phi*const.M_H2O;            % mass fraction H2O
MF_N2 = 69.56*const.M_N2;               % mass fraction N2
MF_O2 = 18.5*(1-phi)*const.M_O2;        % mass fraction O2
MF = [MF_CO2 MF_H2O MF_N2 MF_O2]';


M = [const.M_CO2; const.M_H2O; const.M_N2; const.M_O2];     % molar mass

ABCD = [const.abcd_CO2; const.abcd_H2O; ...
        const.abcd_N2; const.abcd_O2];  % specific heat constants (3-poly)


[cp, cv, k] = specHeatMix(M, MF, ABCD, T);

end
=======
[cp, cv, k] = specHeatMix(M, MF, ABCD(:,1), ABCD(:,2), ABCD(:,3), ABCD(:,4), T);

end

