function plotsPart2(To2,To3,To4,To5,To8,...
    Po2, Po3, Po4, Po5, Po8,...
    M2, M3, M4, M5, M8,...
    V2, V3, V4, V5, V8,...
    m_air, m_fuel);

% Plots all the graphs required for part 2 of assignment

w = [45:5:80]; % spool speed
kg_To_g = 1e3;
Pa_To_kPa = 1e-3;

% Plot Temperatures
figure(1)
h1 = plot(w,To2,'*-',...
    w,To3,'*-',...
    w,To4,'*-',...
    w,To5,'*-',...
    w,To8,'*-');
legend('Station 2',...
    'Station 3',...
    'Station 4',...
    'Station 5',...
    'Station 8',...
    'Location','East')
xlabel('Spool Speed [krpm]')
ylabel('Stagnation Temperature [K]')
title('Stagnation Temperature vs Spool Speed (Combustion Products)')
plotfixer;
ylim([250,950]);
xlim([45,80]);
set(h1,'LineWidth',3);
print('-depsc','-tiff','-r300','TovsSpeed');

% Plot Pressures
figure(2)
h2 = plot(w,Po2 * Pa_To_kPa,'*-',...
    w,Po3 * Pa_To_kPa,'*-',...
    w,Po4 * Pa_To_kPa,'*-',...
    w,Po5 * Pa_To_kPa,'*-',...
    w,Po8 * Pa_To_kPa,'*-');
legend('Station 2',...
    'Station 3',...
    'Station 4',...
    'Station 5',...
    'Station 8',...
    'Location','NorthWest')
xlabel('Spool Speed [krpm]')
ylabel('Stagnation Pressure [kPa]')
title('Stagnation Pressure vs Spool Speed (Combustion Products)')
plotfixer;
ylim([95,295]);
xlim([45,80]);
set(h2,'LineWidth',3);
print('-depsc','-tiff','-r300','PovsSpeed');

% Plot Mach Numbers
figure(3)
h3 = plot(w,M2,'*-',...
    w,M3,'*-',...
    w,M4,'*-',...
    w,M5,'*-',...
    w,M8,'*-');
legend('Station 2',...
    'Station 3',...
    'Station 4',...
    'Station 5',...
    'Station 8',...
    'Location','NorthWest')
xlabel('Spool Speed [krpm]')
ylabel('Mach Number')
title('Mach Number vs Spool Speed (Combustion Products)')
plotfixer;
ylim([0,0.52]);
xlim([45,80]);
set(h3,'LineWidth',3);
print('-depsc','-tiff','-r300','MvsSpeed');

% Plot Velocities
figure(4)
h4 = plot(w,V2,'*-',...
    w,V3,'*-',...
    w,V4,'*-',...
    w,V5,'*-',...
    w,V8,'*-');
legend('Station 2',...
    'Station 3',...
    'Station 4',...
    'Station 5',...
    'Station 8',...
    'Location','NorthWest')
xlabel('Spool Speed [krpm]')
ylabel('Velocity [m/s]')
title('Velocity vs Spool Speed (Combustion Products)')
plotfixer;
ylim([0,300]);
xlim([45,80]);
set(h4,'LineWidth',3);
print('-depsc','-tiff','-r300','VvsSpeed');

% % Plot Air Mass Flow Rate
% figure(5)
% h5 = plot(w,m_air*kg_To_g,'*-');
% xlabel('Spool Speed [krpm]')
% ylabel('Air Mass Flow Rate [g/s]')
% title('Air Mass Flow Rate vs Spool Speed')
% plotfixer;
% ylim([120,300]);
% xlim([45,80]);
% set(h5,'LineWidth',3);
% print('-depsc','-tiff','-r300','M_airvsSpeed');
% 
% % Plot Fuel Mass Flow Rate
% figure(6)
% h6 = plot(w,m_fuel*kg_To_g,'*-');
% xlabel('Spool Speed [krpm]')
% ylabel('Fuel Mass Flow Rate [g/s]')
% title('Fuel Mass Flow Rate vs Spool Speed')
% plotfixer;
% ylim([2,4]);
% xlim([45,80]);
% set(h6,'LineWidth',3);
% print('-depsc','-tiff','-r300','M_corevsSpeed');
% 
% % Plot Air-Fuel Ratio
% figure(7)
% h7 = plot(w,m_air./m_fuel,'*-');
% xlabel('Spool Speed [krpm]')
% ylabel('Air-Fuel Ratio')
% title('Air-Fuel Ratio vs Spool Speed')
% plotfixer;
% ylim([60,80]);
% xlim([45,80]);
% set(h7,'LineWidth',3);
% print('-depsc','-tiff','-r300','AFRatiovsSpeed');

end