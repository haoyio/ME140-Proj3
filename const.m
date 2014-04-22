classdef const
    % The constants class
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
    Ru = 8.314;%[J/kgK]
    
    %Fuel LHV
    LHV = 42800e3 %J/kg

    %Specific heat constants
    a_air = 28.11; b_air = 0.1967e-2; c_air = 0.4802e-5; d_air = -1.966e-9;
    a_O2 = 25.48; b_O2 = 1.52e-2; c_O2 = -0.7155e-5; d_O2 = 1.312e-9;
    a_H2 = 29.11; b_H2 = -0.1916e-2; c_H2 = 0.4003e-5; d_H2 = -0.8704e-9;
    a_N2 = 28.90; b_N2 = -0.1571e-2; c_N2 = 0.8081e-5; d_N2 = -2.873e-9;
    a_H2O = 32.24; b_H2O = 0.1923e-2; c_H2O = 1.055e-5; d_H2O = -3.595e-9;
    a_CO2 = 22.26; b_CO2 = 5.981e-2; c_CO2 = -3.501e-5; d_CO2 = 7.469e-9;

    abcd_air = [28.11 0.1967e-2 0.4802e-5 -1.966e-9];
    abcd_O2 = [25.48 1.52e-2 -0.7155e-5 1.312e-9];
    abcd_H2 = [29.11 -0.1916e-2 0.4003e-5 -0.8704e-9];
    abcd_N2 = [28.90 -0.1571e-2 0.8081e-5 -2.873e-9];
    abcd_H2O = [32.24 0.1923e-2 1.055e-5 -3.595e-9];
    abcd_CO2 = [22.26 5.981e-2 -3.501e-5 7.469e-9];

    % Molar masses
    M_O2 = 31.998; M_N2 = 28.014; M_C12H26 = 170.3374; M_C123H222 = 170.1107;
    M_CO2 = 44.009; M_H2O = 18.0148; M_C = 12.011; M_H2 = 2.0158;
    
    % Heats of formation
    href_CO2 = -393520; %kJ/kmol
    href_H2O = -285830; %kJ/kmol
    href_O2 = 0; %kJ/kmol
    href_N2 = 0; %kJ/kmol
    
    %Heats of formation of surrogate fuel (C12.3H22.2)
    hf_surr_molar = -243760.9; %J/mol
    hf_surr = 1432954.686; %J/kg
    end

end
