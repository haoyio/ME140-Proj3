function plotsPart3(thrust_calc, thrust_meas, specific_thrust, TSFC, eta)

% Plots all the part 3 graphs required in assignment

w = [45:5:80]; % spool speed
kg_To_g = 1e3;

% Plot Measured Thrust and Calculated Thrust
figure(1)
h1 = plot(w,thrust_calc,'*-',...
    w,thrust_meas,'*-');
legend('Calculated Thrust','Measured Thrust','Location','NorthWest')
xlabel('Spool Speed [krpm]')
ylabel('Thrust [N]')
title('Measured and Calculated Thrust vs Spool Speed')
plotfixer;
ylim([10,90]);
xlim([45,80]);
set(h1,'LineWidth',3);
print('-depsc','-tiff','-r300','ThrustvsSpeed');

% Plot Specific Thrust
figure(2)
h2 = plot(w,specific_thrust,'*-');
xlabel('Spool Speed [krpm]')
ylabel('Specific Thrust (Ns)/kg_{total}')
title('Specific Thrust vs Spool Speed')
plotfixer;
ylim([100,280]);
xlim([45,80]);
set(h2,'LineWidth',3);
print('-depsc','-tiff','-r300','STvsSpeed');

% Plot Thrust Specific Fuel Consumption
figure(3)
h3 = plot(w,TSFC*kg_To_g,'*-');
xlabel('Spool Speed [krpm]')
ylabel('Thrust Specific Fuel Consumption kg_{fuel}/(Ns)')
title('Thrust Specific Fuel Consumption vs Spool Speed')
plotfixer;
ylim([0.04,0.14]);
xlim([45,80]);
set(h3,'LineWidth',3);
print('-depsc','-tiff','-r300','TSFCvsSpeed');

% Plot Thermal Efficiency
figure(4)
h4 = plot(w,eta,'*-');
xlabel('Spool Speed [krpm]')
ylabel('Thermal Efficiency')
title('Thermal Efficiency vs Spool Speed')
plotfixer;
ylim([0,0.07]);
xlim([45,80]);
set(h4,'LineWidth',3);
print('-depsc','-tiff','-r300','Thermal_EffvsSpeed');

end