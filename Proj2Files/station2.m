function [mdot, P, Po, M, v, T, To] = station2(DP, Patm, Tm)
%station2 This function calculates the mass flow rate, Mach number, static
%presure, stagnation pressure, static temperature and stagnation
%temperature using the flow properties at the inlet.

%Temporary:
mdot=0; P=0; Po=0; M=0; v=0; T=0; To=0;

%Calculate stagnation pressure.
Po = ones(length(DP), 1) .* const.Patm .* const.prf;

%Load the inlet area.
A = const.A2;

%Calculate the static pressure.
P = Po - DP;

%Calculate the specific heats for Tm.
[Cp, Cv, k] = specHeat(Tm);

%Calculate the Mach number from pressure ratio.
M = zeros(length(DP), 1);
for i=1:length(M)
    M(i) = isentropic_P_P0_in_M_out(P(i)./Po(i), k(i));
end

% Calculate the static temperature from Mach number and Tm.
T = Tm ./ (1 + const.RF_cr.*k.*const.R.*M.^2./(2.*Cp));

%Calculate the velocity from the Mach number and temperature.
v = M .* (k .* const.R .* T).^0.5;

%Calculate the stagnation temperature from T and Mach number.
To = zeros(length(T), 1);
for i=1:length(To)
    To(i) = T(i) ./ isentropic_T_T0_out_M_in(M(i), k(i));
end

%Calculate the mass flow using MFP, Po, To and the area.
mdot = zeros(length(T), 1);
for i=1:length(mdot)
    mdot(i) = isentropic_MFP_out_M_in(M(i), k(i)) .* A .* Po(i) ./...
        ((const.R .* To(i)).^0.5);
end
end

