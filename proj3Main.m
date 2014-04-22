%% proj3Main()
clear; close all; clc;

loaddata;

% Station 2 conditions (air)
[m_air, P2, Po2, M2, V2, T2, To2] = ...
    impactProbeStation_2(DP2, const.Patm, T2m);

% Station 3 conditions (air)
[P3, Po3, M3, V3, T3, To3] = ...
    impactProbeStations_3_5_8(m_air, const.A3, T3m, Po3, const.RF_cr);

% Station 4 conditions (air)
[P4, Po4, M4, V4, T4, To4] = ...
   impactProbeStation_4(m_air, const.A4, T4m, P4, const.RF_cr);

% Station 5 conditions (air)
[P5, Po5, M5, V5, T5, To5] = ...
   impactProbeStations_3_5_8(m_air + m_fuel, const.A5, T5m, Po5, const.RF_ax);

% Station 8 conditions (air)
[P8, Po8, M8, V8, T8, To8] = ...
    impactProbeStations_3_5_8(m_air + m_fuel, const.A8, T8m, Po8, const.RF_cr);


AF = m_air./m_fuel;

% Station 4 conditions (combustion products)
[P4c, Po4c, M4c, V4c, T4c, To4c] = ...
    productsStation_4(m_air + m_fuel, const.A4, T4m, P4, const.RF_cr, AF);

% Station 5 conditions (combustion products)
% [P5c, Po5c, M5c, V5c, T5c, To5c] = ...
%     productsStations_5_8(m_air + m_fuel, const.A5, T5m, Po5, const.RF_ax, AF);

% Station8 conditions (combustion products)
% [P8c, Po8c, M8c, V8c, T8c, To8c] = ...
%     productsStations_5_8(m_air + m_fuel, const.A8, T8m, Po8, const.RF_cr, AF);

% % PART 4 stuff
% % Generate struct for part 4 function
% in4.To2 = To2; in4.Po2 = Po2;
% in4.To3 = To3; in4.Po3 = Po3;
% in4.To4 = To4; in4.Po4 = Po4;
% in4.To5 = To5; in4.Po5 = Po5;
% in4.To8 = To8; in4.Po8 = Po8;
% in4.mdot_fuel = m_fuel;
% in4.mdot_air = m_air;
% in4.v8 = V8;
% in4.P8 = P8;
% 
% out4 = wrapperPart4(in4, length(DP2)); % get eff_NOZ, eff_TUR, eff_CMB, eff_COM,
%                           % work_TUR, work_COM, Po4/Po3 (Po4_Po3)
% 
% 
% %Calculate the specific thrust, TSFC and thermal efficiency and plot them.
% [thrust_calc, specific_thrust, TSFC, eta] = part3(m_air+m_fuel, m_fuel, V8, const.LHV);


% plotsPart2(To2,To3,To4,To5,To8,...
%     Po2, Po3, Po4, Po5, Po8,...
%     M2, M3, M4, M5, M8,...
%     V2, V3, V4, V5, V8,...
%     m_air, m_fuel);
% 
% plotsPart3(thrust_calc, thrust, specific_thrust, TSFC, eta);
% 
% plotsPart4(in4)