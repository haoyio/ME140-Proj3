function [cp, cv, k] = specHeatMix(M, MF, ABCD, T)

%
% Returns specific heats for the mixture.
% 
% M = molar mass [g/mol]
% MF = mass fraction
% ABCD = specific heat constants [J/mol, J/molK, J/molK^2, J/molK^3]
% T = temperature [K]
%

M_mix = MF'*M/1e3;  % [kg/mol] mixture molar mass

cp = MF'*ABCD*[1 T T^2 T^3]'/M_mix; % [J/kgK] mixture cp
cv = cp - const.R; % [J/kgK] mixture cv
k = cp./cv; % [] mixture k

end