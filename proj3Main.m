%% proj3Main()
clear; close all; clc;

loaddata;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculations for air with variable specific heats
[m_air, P2, Po2, M2, V2, T2, To2] = ...
    impactProbeStation_2(DP2, const.Patm, T2m);
[P3, Po3, M3, V3, T3, To3] = ...
    impactProbeStations_3_5_8(m_air, const.A3, T3m, Po3, const.RF_cr, 1);
[P4, Po4, M4, V4, T4, To4] = ...
   impactProbeStation_4(m_air, const.A4, T4m, P4, const.RF_cr, 1);
[P5, Po5, M5, V5, T5, To5] = ...
   impactProbeStations_3_5_8(m_air + m_fuel, const.A5, T5m, Po5, const.RF_ax, 1);
[P8, Po8, M8, V8, T8, To8] = ...
    impactProbeStations_3_5_8(m_air + m_fuel, const.A8, T8m, Po8, const.RF_cr, 1);

AF = m_air./m_fuel;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculations for combustion products
[P4c, Po4c, M4c, V4c, T4c, To4c] = ...
    productsStation_4(m_air + m_fuel, const.A4, T4m, P4, const.RF_cr, AF);
[P5c, Po5c, M5c, V5c, T5c, To5c] = ...
    productsStations_5_8(m_air + m_fuel, const.A5, T5m, Po5, const.RF_ax, AF);
[P8c, Po8c, M8c, V8c, T8c, To8c] = ...
    productsStations_5_8(m_air + m_fuel, const.A8, T8m, Po8, const.RF_cr, AF);
%%
% Calculations for air with constant specific heats
[P4, Po4, M4, V4, T4, To4] = ...
   impactProbeStation_4(m_air, const.A4, T4m, P4, const.RF_cr, 1);
[P5, Po5, M5, V5, T5, To5] = ...
   impactProbeStations_3_5_8(m_air + m_fuel, const.A5, T5m, Po5, const.RF_ax, 1);

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % PART 4 stuff
% Generate struct for part 4 function
in4.To2 = To2; in4.Po2 = Po2;
in4.To3 = To3; in4.Po3 = Po3;
in4.To4 = To4c; in4.Po4 = Po4c;
in4.To5 = To5c; in4.Po5 = Po5c;
in4.To8 = To8c; in4.Po8 = Po8c;
in4.mdot_fuel = m_fuel;
in4.mdot_air = m_air;
in4.v8 = V8c;
in4.P8 = P8c;

out4 = wrapperPart4(in4, length(DP2)); % get eff_NOZ, eff_TUR, eff_CMB, eff_COM,
                          % work_TUR, work_COM, Po4/Po3 (Po4_Po3)


%Calculate the specific thrust, TSFC and thermal efficiency and plot them.
[thrust_calc, specific_thrust, TSFC, eta] =...
    part3(m_air+m_fuel, m_fuel, V8c, const.LHV);

%%
plotsPart2(To2,To3,To4,To5,To8,...
    Po2, Po3, Po4c, Po5c, Po8c,...
    M2, M3, M4c, M5c, M8c,...
    V2, V3, V4c, V5c, V8c,...
    m_air, m_fuel);

plotsPart3(thrust_calc, thrust, specific_thrust, TSFC, eta);

plotsPart4(in4)

%%
[workVarCp,workConstCp,workComb] = deal(zeros(1,8));
for i = 1:8
    workVarCp(i) = getWork(To4(i), To5(i), m_air(i) + m_fuel(i), 1);
    workConstCp(i) = getWork(To4(i), To5(i), m_air(i) + m_fuel(i), 0);
    workCombProd(i) = getWork(To4(i), To5(i), m_air(i) + m_fuel(i), 1);
end

w = [45:5:80]; % spool speed
W_to_kW = 1e-3;

% Plot Compressor/Turbine Power
figure(1)
h1 = plot(w,workCombProd*W_to_kW,'d-',...
    w,workVarCp*W_to_kW,'o-',...
    w,workConstCp*W_to_kW,'*-');
legend('Combustion Products, Variable Cp',...
    'Air, Variable Cp',...
    'Air, Constant Cp',...
    'Location','NorthWest')
xlabel('Spool Speed [krpm]')
ylabel('Power [kW]')
title('Power Produced/Consumed vs Spool Speed')
plotfixer;
ylim([0,45]);
xlim([45,80]);
set(h1,'LineWidth',3);
print('-depsc','-tiff','-r300','3xTurbineWorkvsSpeed');



%%
proj3part2plots

%%

To4s = zeros(1,length(w));
To5s = zeros(1,length(w));
work_turbine = zeros(1,length(w));

for i = 1:length(w)
    To4s(i) = adiabaticFlameTemperature(AF(i),To3(i));
    [To5s(i),work_turbine(i)] = workTurbine(To4s(i), Po5c(i)/Po4c(i),AF(i));
end

figure(1)
plot(w,To4s,'*-',...
    w,To5s,'*-');
plotfixer;

figure(2)
plot(w,work_turbine,'*-')
plotfixer;
