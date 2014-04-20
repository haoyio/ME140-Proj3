function [cp, cv, k] = specHeatMix(M, MF, a, b, c, d, T)

%
% Returns specific heats for the mixture.
% 
% M = molar mass
% MF = mass fraction
% a, b, c, d = specific heat constants
% T = temperature
%

M_mix = MF'*M;  % mixture molar mass
cp_mix = MF'*(a + T*b + T^2*c + T^3*d); % mixture cp
cv = cp - const.Ru; % mixture cv
k = cp./cv; % mixture k

end