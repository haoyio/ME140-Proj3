function [cp, cv, k] = specHeatC12H26(AF, T)

% 
% Returns dodecane-air fuel mixture specific heats (see eqn below)
%
% phi*C12H26 + 18.5*(O2 + 3.76*N2) -> 
%   12*phi*CO2 + 13*phi*H2O + (3.76*18.5)*N2 + 18.5*(1-phi)*O2
% 

% Compute mass fractions
AF_stoich = 18.5(const.M_O2 + ...       % stoichometric air-fuel ratio
            3.76*const.M_N2)/M_C12H26;
phi = AF_stoich/AF;                     % equivalence ratio
MF_CO2 = 12*phi*const.M_CO2;            % mass fraction CO2
MF_H2O = 13*phi*M_H2O;                  % mass fraction H2O
MF_N2 = 69.56*M_N2;                     % mass fraction N2
MF_O2 = 18.5*(1-phi)*M_O2;              % mass fraction O2
MF = [MF_CO2 MF_H2O MF_N2 MF_O2]';

ABCD = [abcd_CO2; abcd_H2O; abcd_N2; abcd_O2];  % specific heat constants (3-poly)
[cp, cv, k] = specHeatMix(M, MF, ABCD(:,1), ABCD(:,2), ABCD(:,3), ABCD(:,4), T);

end