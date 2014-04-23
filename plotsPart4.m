function plotsPart4(in)
% Plots all the required graphs in part 4
% function project2Part4Plots(struct in);
numDataPoints = 8;
out = wrapperPart4(in,numDataPoints);
w = [45:5:80]; % spool speed


% power (produced and consumed) vs spool speed
compressor_work = out.work_COM;
turbine_work = out.work_TUR;

% compressor & turbine efficiency vs spool speed
compressor_efficiency = out.eff_COM;
turbine_efficiency = out.eff_TUR;

% stagnation pressure drop across combustor vs spool speed
Po4_Po3 = out.Po4_Po3;

% nozzle efficiency vs spool speed
nozzle_efficiency = out.eff_NOZ;

% apparent combustor efficiency vs spool speed
combustor_efficiency = out.eff_CMB;

W_to_kW = 1e-3;


% Plot Compressor/Turbine Power
figure(1)
h1 = plot(w,compressor_work*W_to_kW,'*-',...
    w,turbine_work*W_to_kW,'*-');
legend('Compressor - Work Consumed',...
    'Turbine - Work Produced',...
    'Location','NorthWest')
xlabel('Spool Speed [krpm]')
ylabel('Power [kW]')
title('Power Produced/Consumed vs Spool Speed')
plotfixer;
ylim([0,45]);
xlim([45,80]);
set(h1,'LineWidth',3);
print('-depsc','-tiff','-r300','PowervsSpeed');

% Plot Compressor/Turbine Efficiency
figure(2)
h2 = plot(w,compressor_efficiency,'*-',...
    w,turbine_efficiency,'*-');
legend('Compressor Efficiency',...
    'Turbine Efficiency',...
    'Location','East')
xlabel('Spool Speed [krpm]')
ylabel('Efficiency')
title('Compressor and Turbine Efficiency vs Spool Speed')
plotfixer;
ylim([0,0.85]);
xlim([45,80]);
set(h2,'LineWidth',3);
print('-depsc','-tiff','-r300','Comp_Tur_EffvsSpeed');

% Plot Stagnation Pressure Drop Across Combustor
figure(3)
h3 = plot(w,Po4_Po3,'*-');
xlabel('Spool Speed [krpm]')
ylabel('Stagnation Pressure Ratio')
title('Stagnation Pressure Ratio Across Combustor vs Spool Speed')
plotfixer;
ylim([0.975,0.985]);
xlim([45,80]);
set(h3,'LineWidth',3);
print('-depsc','-tiff','-r300','PressureDropvsSpeed');

% Plot Nozzle Efficiency
figure(4)
h4 = plot(w,nozzle_efficiency,'*-');
xlabel('Spool Speed [krpm]')
ylabel('Nozzle Efficiency')
title('Nozzle Efficiency vs Spool Speed')
plotfixer;
ylim([0.62,0.745]);
xlim([45,80]);
set(h4,'LineWidth',3);
print('-depsc','-tiff','-r300','Noz_EffvsSpeed');

% % Plot Combustor Efficiency
% figure(5)
% h5 = plot(w,combustor_efficiency,'*-');
% xlabel('Spool Speed [krpm]')
% ylabel('Combustor Efficiency')
% title('Combustor Efficiency vs Spool Speed')
% plotfixer;
% ylim([0.63,0.93]);
% xlim([45,80]);
% set(h5,'LineWidth',3);
% print('-depsc','-tiff','-r300','Comb_EffvsSpeed');

end
