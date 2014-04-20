function plotsPart2(To2,To3,To4,To5,To8,...
    Po2, Po3, Po4, Po5, Po8,...
    M2, M3, M4, M5, M8,...
    V2, V3, V4, V5, V8,...
    m_air, m_fuel);

spool_speed = [45:5:80];
w = spool_speed;
kg_To_g = 1e3;


% Plot Temperatures
figure(1)
plot(w,To2,w,To3,w,To4,w,To5,w,To8)
legend('To2','To3','To4','To5','To8')
xlabel('Spool Speed [krpm]')
ylabel('Station Stagnation Temperature [K]')
title('Station Stagnation Temperature vs Spool Speed')
plotfixer;
print('-depsc','-tiff','-r300','TovsSpeed');

% Plot Pressures
figure(2)
plot(w,Po2,w,Po3,w,Po4,w,Po5,w,Po8)
legend('Po2','Po3','Po4','Po5','Po8')
xlabel('Spool Speed [krpm]')
ylabel('Station Stagnation Pressure [Pa]')
title('Station Stagnation Pressure vs Spool Speed')
plotfixer;
print('-depsc','-tiff','-r300','PovsSpeed');

% Plot Mach Numbers
figure(3)
plot(w,M2,w,M3,w,M4,w,M5,w,M8)
legend('M2','M3','M4','M5','M8')
xlabel('Spool Speed [krpm]')
ylabel('Station Mach Number []')
title('Station Mach Number vs Spool Speed')
plotfixer;
print('-depsc','-tiff','-r300','MvsSpeed');

% Plot Velocities
figure(4)
plot(w,V2,w,V3,w,V4,w,V5,w,V8)
legend('V2','V3','V4','V5','V8')
xlabel('Spool Speed [krpm]')
ylabel('Station Velocity [m/s]')
title('Station Velocity vs Spool Speed')
plotfixer;
print('-depsc','-tiff','-r300','VvsSpeed');


% Plot Air Mass Flow Rate

figure(5)
plot(w,m_air*kg_To_g)
xlabel('Spool Speed [krpm]')
ylabel('Air Mass Flow Rate [g/s]')
title('Air Mass Flow Rate vs Spool Speed')
plotfixer;
print('-depsc','-tiff','-r300','M_airvsSpeed');

% Plot Fuel Mass Flow Rate
figure(6)
plot(w,m_fuel*kg_To_g)
xlabel('Spool Speed [krpm]')
ylabel('Fuel Mass Flow Rate [g/s]')
title('Fuel Mass Flow Rate vs Spool Speed')
plotfixer;
print('-depsc','-tiff','-r300','M_corevsSpeed');

% Plot Air-Fuel Ratio
figure(7)
plot(w,m_air./m_fuel)
xlabel('Spool Speed [krpm]')
ylabel('Air-Fuel Ratio []')
title('Air-Fuel Ratio vs Spool Speed')
plotfixer;
print('-depsc','-tiff','-r300','AFRatiovsSpeed');

end