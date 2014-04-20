input.isVarK = 1;

% Placeholder constants (all quantities in SI units; values from Project 1)
input.mdot_total = 265;
input.mdot_air = 24.09;
input.mdot_fuel = 0.5740;

input.To2 = 288.1500; input.Po2 = 101400;       % Before compressor
input.To3 = 778.8282; input.Po3 = 2839200;      % After compressor/before combustor
input.To4 = 1650.000; input.Po4 = 2697240;      % After combustor/before turbine
input.To5 = 887.1000; input.Po5 = 1.4070e5;     % After turbine/before nozzle
input.To8 = 887.1000; input.Po8 = 1.3832e5;     % After nozzle

output = part4(input)