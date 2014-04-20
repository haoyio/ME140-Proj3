function out = wrapperPart4(in, numDataPoints)

%
% struct out = wrapperPart4(struct in);
% 
% Wrapper function to take in input of stagnation property vectors
% and mass flow rates. Returns work output/input and efficiencies.
% 
% ------------------------------------------------------------
% Created by:       Hao Yi Ong
% Last modified:    April 14, 2014
%

for i = 1:numDataPoints
    % Get data for specific engine speed
    input.isVarK = 1;
    input.mdot_air = in.mdot_air(i);
    input.mdot_fuel = in.mdot_fuel(i);
    
    input.To2 = in.To2(i); input.Po2 = in.Po2(i); % Before compressor
    input.To3 = in.To3(i); input.Po3 = in.Po3(i); % After compressor/before combustor
    input.To4 = in.To4(i); input.Po4 = in.Po4(i); % After combustor/before turbine
    input.To5 = in.To5(i); input.Po5 = in.Po5(i); % After turbine/before nozzle
    input.To8 = in.To8(i); input.Po8 = in.Po8(i); % After nozzle
    input.v8 = in.v8(i);
    input.P8 = in.P8(i);
    
    output = part4(input);      % get efficiencies and work in/out
    
    % Compute data
    out.work_COM(i) = output.work_COM;
    out.work_TUR(i) = output.work_TUR;
    out.eff_COM(i) = output.eff_COM;
    out.eff_TUR(i) = output.eff_TUR;

    out.Po4_Po3(i) = output.Po4_Po3;
    out.eff_NOZ(i) = output.eff_NOZ;
    out.eff_CMB(i) = output.eff_CMB;
end

end