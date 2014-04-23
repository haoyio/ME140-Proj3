function [Tout] = adiabaticFlameTemperature(AF, Tin)
%adiabaticFlameTemperature calculates adiabatic flame temperature using the
%combustor inlet temperature and air-fuel ratio.

% Calculate equivalence ratio
AF_stoich = 17.85*(const.M_O2 + ...      % stoichometric air-fuel ratio
            3.76*const.M_N2)/const.M_C123H222;
phi = AF_stoich/AF;                     % equivalence ratio


%Get the heat difference between the actual and reference temperatures.
q12 = 0; %Heat to get from Tin to Tref
T = Tin;
dT = -0.1; %Don't forget to change to + when copying.
while T > const.Tref
    [Cp, ~, ~] = specHeat(T);
    q12 = q12 + 17.85 .* 100/21 .* Cp .* const.M_air .* dT ./ 1000;
    T = T + dT;
end

%Get the molar heat of isothermic reaction
q23 = 12.3 .* phi .* const.href_CO2 + 11.1 .* phi .* const.href_H2O - ...
    phi .* const.hf_surr_molar;

%Get the heat of raising the products from Tref to Tf
q34 = -(q23 + q12);

%Find the reactant temperature using the heat change formula.
Tout = const.Tref;
dT = 0.1;
q = 0;
M = getMolMassMix(AF); %Molar mass of mixture
M_total = 12.3*phi + 11.1*phi + 3.76*17.85 + 17.85*(1-phi); %Number of moles.
while q < q34
    [Cp, ~, ~] = specHeatC123H222(AF, Tout);
    q = q + Cp .* M ./ 1000 .* M_total .* dT;
    Tout = Tout + dT;
end

%{
I1 = 0;
dT = 0.01;
for Ti = const.Tref:dT:Tin
    [Cp,Cv,k] = specHeat(Tin);
    I1 = I1 + Cp * const.M_air * dT;
end
H_reactants = phi * const.hf_surr_molar + 17.85 * I1;

I2 = 0;
H_products = 12.3 * phi * const.href_CO2 +...
    11.1 * phi * const.href_H2O;
Ti = const.Tref;
while H_products < H_reactants
%     [Cp_CO2,~,~] = specHeatMix(const.M_CO2,1,const.abcd_CO2,Ti);
%     [Cp_H2O,~,~] = specHeatMix(const.M_H2O,1,const.abcd_H2O,Ti);
%     [Cp_N2,~,~] = specHeatMix(const.M_N2,1,const.abcd_N2,Ti);
%     [Cp_O2,~,~] = specHeatMix(const.M_O2,1,const.abcd_O2,Ti);
%     
%     
%     h1 = 12.3 * phi * Cp_CO2 * const.M_CO2 * dT;
%     h2 = 11.1 * phi * Cp_H2O * const.M_H2O * dT;
%     h3 = 67.116 * Cp_N2 * const.M_N2 * dT;
%     h4 = 17.85 * (1-phi) * Cp_O2 * const.M_O2 * dT;
%     
%     H_products = H_products + h1 + h2 + h3 + h4;
%     Ti = Ti + dT;
    
    M_mix = getMolMassMix(AF);
    [Cp,Cv,k] = specHeatC123H222(AF,Ti);
    I2 = I2 + Cp * M_mix;
    H_products = H_products + Cp * M_mix;
    Ti = Ti + dT;
end

H_reactants
H_products
Ti

%}
end

