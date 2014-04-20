clear; close all; clc;

%Load the data
loaddata;

%Determine mdot, P2, P02, M2, v2, T2 and T02 from the inlet conditions.
[m_air, P2, Po2, M2, V2, T2, To2] = station2(DP2, const.Patm, T2m);

% Calculate properties at station 3
[P3, Po3, M3, V3, T3, To3] = wrapperImpactProbe(m_air, const.A3, T3m, Po3, const.RF_cr);

% Calculate properties at station 4
[P4, Po4, M4, V4, T4, To4] = wrapperStation4AF(m_air, m_fuel, const.A4, T4m, P4, const.RF_cr);

% Calculate properties at station 5
[P5, Po5, M5, V5, T5, To5] = wrapperImpactProbeAF(m_air, m_fuel, const.A5, T5m, Po5, const.RF_ax);

% Calculate properties at station 8
[P8, Po8, M8, V8, T8, To8] = wrapperImpactProbeAF(m_air, m_fuel, const.A8, T8m, Po8, const.RF_cr);

% PART 4 stuff
% Generate struct for part 4 function
in4.To2 = To2; in4.Po2 = Po2;
in4.To3 = To3; in4.Po3 = Po3;
in4.To4 = To4; in4.Po4 = Po4;
in4.To5 = To5; in4.Po5 = Po5;
in4.To8 = To8; in4.Po8 = Po8;
in4.mdot_fuel = m_fuel;
in4.mdot_air = m_air;
in4.v8 = V8;
in4.P8 = P8;

out4 = wrapperPart4AF(in4, length(DP2)); % get eff_NOZ, eff_TUR, eff_CMB, eff_COM,
                          % work_TUR, work_COM, Po4/Po3 (Po4_Po3)


%Calculate the specific thrust, TSFC and thermal efficiency
[thrust_calc, specific_thrust, TSFC, eta] = part3(m_air+m_fuel, m_fuel, V8, const.LHV);