function plotsPart3(thrust_calc, thrust_meas, specific_thrust, TSFC, eta)

spool_speed = [45:5:80];
w = spool_speed;

% Plot Measured Thrust and Calculated Thrust
figure(1)
plot(w,thrust_calc,w,thrust_meas)
legend('Calculated Thrust','Measured Thrust')
xlabel('Spool Speed [krpm]')
ylabel('Thrust [N]')
title('Measured and Calculated Thrust vs Spool Speed')
plotfixer;
print('-depsc','-tiff','-r300','ThrustvsSpeed');

% Plot Specific Thrust
figure(2)
plot(w,specific_thrust)
xlabel('Spool Speed [krpm]')
ylabel('Specific Thrust [N-s/kg]')
title('Specific Thrust vs Spool Speed')
plotfixer;
print('-depsc','-tiff','-r300','STvsSpeed');

% Plot Thrust Specific Fuel Consumption
figure(3)
plot(w,TSFC)
xlabel('Spool Speed [krpm]')
ylabel('Thrust Specific Fuel Consumption [kg/N-s]')
title('Thrust Specific Fuel Consumption vs Spool Speed')
plotfixer;
print('-depsc','-tiff','-r300','TSFCvsSpeed');

% Plot Thermal Efficiency
figure(4)
plot(w,eta)
xlabel('Spool Speed [krpm]')
ylabel('Thermal Efficiency []')
title('Thermal Efficiency vs Spool Speed')
plotfixer;
print('-depsc','-tiff','-r300','Thermal_EffvsSpeed');

end