function output = part4(input)

% struct output = part4(bool isVarK, struct input)
% 
% Given input struct containing all stagnation properties
% and mass flow rates, returns component efficiencies and
% work output/input, and plot how each quantity varies with
% engine speed.
%
% ------------------------------------------------------------
% Created by:       Hao Yi Ong
% Last modified:    April 14, 2014
% 

% Load problem data (mass flow rate and stagnation properties)
isVarK = input.isVarK;
mdot_air = input.mdot_air;
mdot_fuel = input.mdot_fuel;

To2 = input.To2; Po2 = input.Po2;
To3 = input.To3; Po3 = input.Po3;
To4 = input.To4; Po4 = input.Po4;
To5 = input.To5; Po5 = input.Po5;
To8 = input.To8; Po8 = input.Po8;

v8 = input.v8;
P8 = input.P8;

% Calculate work (extensive) and adiabatic efficiencies
% (figure of merit) for the compressor and turbine
[work_COM, eff_COM] = getWorkEffComp(To2,Po2,To3,Po3,mdot_air,isVarK);
[work_TUR, eff_TUR] = getWorkEffTurb(To4,Po4,To5,Po5,mdot_air+mdot_fuel,isVarK);

output.work_COM = work_COM;
output.work_TUR = work_TUR;
output.eff_COM = eff_COM;
output.eff_TUR = eff_TUR;

% Compute stagnation pressure ratio across combustor
output.Po4_Po3 = Po4/Po3;

% Compute adiabatic efficiency of nozzle
output.eff_NOZ = getEffNozz(To5,Po5,To8,v8,P8,isVarK);

% Compute apparent combustion efficiency
output.eff_CMB = getEffComb(To3,To4,isVarK,mdot_air,mdot_fuel);

end