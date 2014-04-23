function M_mix = getMolMassMix(AF)

% Returns the molar mass of the fuel-air mixture (C12.3H22.2 surrogate fuel molecule).

AF_stoich = 17.85*(const.M_O2 + ...      % stoichometric air-fuel ratio
            3.76*const.M_N2)/const.M_C12H26;
phi = AF_stoich/AF;                     % equivalence ratio

M_total = 12.3*phi + 11.1*phi + 3.76*17.85 + 17.85*(1-phi);
MF_CO2 = 12.3*phi/M_total;          % molar fraction CO2
MF_H2O = 11.1*phi/M_total;          % molar fraction H2O
MF_N2 = 3.76*17.85/M_total;         % molar fraction N2
MF_O2 = 17.85*(1-phi)/M_total;      % molar fraction O2
MF = [MF_CO2 MF_H2O MF_N2 MF_O2]';  % molar fractions
M = [const.M_CO2; const.M_H2O; const.M_N2; const.M_O2];     % molar mass

M_mix = MF'*M;  % [g/mol] mixture molar mass

end
