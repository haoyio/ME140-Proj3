function [cp, cv, k] = specHeat(temp)
molarMass = 0.02897;

coeff = [-1.966*10^-9 0.4802*10^-5 0.1967*10^-2 28.11];

R = 287.058; % J/(kg*K)
cp = polyval(coeff, temp) * (1/molarMass);
cv = cp - R;
k = cp ./ cv;

end