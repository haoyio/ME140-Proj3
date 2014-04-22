function [cp, cv, k] = specHeatC123H222(AF, T)

% 
% Returns dodecane-air fuel mixture specific heats (see eqn below)
%
% phi*C12.3H22.2 + 17.85*(O2 + 3.76*N2) -> 
%   12.3*phi*CO2 + 11.1*phi*H2O + (3.76*17.85)*N2 + 17.85*(1-phi)*O2
% 

% Compute mass fractions
AF_stoich = 17.85*(const.M_O2 + ...      % stoichometric air-fuel ratio
            3.76*const.M_N2)/const.M_C123H222;
phi = AF_stoich/AF;                     % equivalence ratio

M_total = 12.3*phi + 11.1*phi + 3.76*17.85 + 17.85*(1-phi);
MF_CO2 = 12.3*phi/M_total;          % molar fraction CO2
MF_H2O = 11.1*phi/M_total;          % molar fraction H2O
MF_N2 = 3.76*17.85/M_total;         % molar fraction N2
MF_O2 = 17.85*(1-phi)/M_total;      % molar fraction O2
MF = [MF_CO2 MF_H2O MF_N2 MF_O2]';  % molar fractions

ABCD = [const.abcd_CO2; const.abcd_H2O; ...
        const.abcd_N2; const.abcd_O2];  % specific heat constants (3-poly)


M = [const.M_CO2; const.M_H2O; const.M_N2; const.M_O2];     % molar mass
[cp, cv, k] = specHeatMix(M, MF, ABCD, T);

end