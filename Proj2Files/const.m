classdef const
    %The constants class
    %   Its values are accessed by referencing const.VAR
   properties (Constant)

    % Conversion constants
    RPM2rads = 2*pi/60;                     % [rad/s per rpm]
    kPa2Pa = 1e3;                           % [Pa per kPa]
    lbf2N = 4.4482216152605;                % [N per lbf]
    in2ToM2 = 0.00064516;
    
    %Station areas
    A1 = 27.3*0.00064516;    % Flow area at inlet of bellmouth [m^2]
    A2 = 6.4*0.00064516;     % Effective flow area at pitot-static probe [m^2]
    A3 = 9.0*0.00064516;     % Area of compressor exit [m^2]
    A4 = 7.2*0.00064516;     % Area before bend to turbine inlet [m^2]
    A5 = 4.7*0.00064516;     % Area of turbine outlet [m^2]
    A8 = 3.87*0.00064516;    % Area of nozzle exit [m^2]

    % Recovery factors
    RF_ax = 0.86;
    RF_cr = 0.68;
    prf = 1;

    %Air properties
    k = 1.4;%[]
    Cp = 1005;%[J/kgK]
    R = 287;%[J/kgK]
    Patm = 101400;%[Pa]
    
    %Fuel LHV
    LHV = 42800e3 %J/kg
   end
end