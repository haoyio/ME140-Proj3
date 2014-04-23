function proj3part2plots
phi = [0.05:0.05:0.65];

Tin = 300;
Tout = zeros(1,length(phi));
for i = 1:length(phi);
    Tout(i) = adiabaticFlameTemperaturePhi(phi(i), Tin);
end

figure(1)
h1 = plot(phi,Tout);
xlabel('Equivalence Ratio')
ylabel('Adiabatic Flame Temperature [K]')
title('Adiabatic Flame Temperature vs Equivalence Ratio (Air and Jet A fuel)')
plotfixer;
ylim([300,2000]);
xlim([0,0.7]);
set(h1,'LineWidth',3);
print('-depsc','-tiff','-r300','FlameTempvsEquivRatio');

end