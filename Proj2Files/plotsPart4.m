function plotsPart4(in)
%
% function project2Part4Plots(struct in);
numDataPoints = 8;
out = wrapperPart4(in,numDataPoints);
spool_speed = [45,50,55,60,65,70,75,80];
w = spool_speed;

% power (produced and consumed) vs spool speed
compressor_work = out.work_COM;
turbine_work = out.work_TUR;
plot(spool_speed,compressor_work,spool_speed,turbine_work)

% compressor & turbine efficiency vs spool speed
compressor_efficiency = out.eff_COM;
turbine_efficiency = out.eff_TUR;
plot(spool_speed,compressor_efficiency,spool_speed,turbine_efficiency)

% stagnation pressure drop across combustor vs spool speed
Po4_Po3 = out.Po4_Po3;
plot(spool_speed,Po4_Po3)

% nozzle efficiency vs spool speed
nozzle_efficiency = out.eff_NOZ;
plot(spool_speed,nozzle_efficiency)

% apparent combustor efficiency vs spool speed
combustor_efficiency = out.eff_CMB;
plot(spool_speed,combustor_efficiency)


% Plot Compressor/Turbine Power
figure(1)
plot(w,compressor_work,w,turbine_work)
legend('Compressor Work','Turbine Work')
xlabel('Spool Speed [krpm]')
ylabel('Power Produced/Consumed [W]')
title('Power Produced/Consumed vs Spool Speed')
plotfixer;
print('-depsc','-tiff','-r300','PowervsSpeed');

% Plot Compressor/Turbine Efficiency
figure(2)
plot(w,compressor_efficiency,w,turbine_efficiency)
legend('Compressor Efficiency','Turbine Efficiency')
xlabel('Spool Speed [krpm]')
ylabel('Efficiency []')
title('Compressor and Turbine Efficiency vs Spool Speed')
plotfixer;
print('-depsc','-tiff','-r300','Comp_Tur_EffvsSpeed');

% Plot Stagnation Pressure Drop Across Combustor
figure(3)
plot(w,Po4_Po3)
xlabel('Spool Speed [krpm]')
ylabel('Stagnation Pressure Ratio Across Combustor []')
title('Stagnation Pressure Ratio Across Combustor vs Spool Speed')
plotfixer;
print('-depsc','-tiff','-r300','PressureDropvsSpeed');

% Plot Nozzle Efficiency
figure(4)
plot(w,nozzle_efficiency)
xlabel('Spool Speed [krpm]')
ylabel('Nozzle Efficiency []')
title('Nozzle Efficiency vs Spool Speed')
plotfixer;
print('-depsc','-tiff','-r300','Noz_EffvsSpeed');

% Plot Combustor Efficiency
figure(5)
plot(w,combustor_efficiency)
xlabel('Spool Speed [krpm]')
ylabel('Combustor Efficiency []')
title('Combustor Efficiency vs Spool Speed')
plotfixer;
print('-depsc','-tiff','-r300','Comb_EffvsSpeed');

end
