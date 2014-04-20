importfile('rawdata.csv'); %importfile('rawdata_ben.csv');

% Conversion constants
RPM2rads = 2*pi/60;                     % [rad/s per rpm]
kPa2Pa = 1e3;                           % [Pa per kPa]
lbf2N = 4.4482216152605;                % [N per lbf]

% Change all to SI units and rename variables
omega = RPM * RPM2rads; clear RPM;      % [rad/s] angular speed
m_fuel = FuelFlow; clear FuelFlow;   % [kg/s] fuel mass flow rate
thrust = Thrust * lbf2N; clear Thrust;  % [N] thrust

T2m = T2 + 273.15; clear T2;            % [K] measured temperature
T3m = T3 + 273.15; clear T3;            % [K] measured temperature
T4m = T4 + 273.15; clear T4;            % [K] measured temperature
T5m = T5 + 273.15; clear T5;            % [K] measured temperature
T8m = T8 + 273.15; clear T8;            % [K] measured temperature

DP2 = DP2 * kPa2Pa;                     % [Pa] dynamic pressure Po2 - P2
Po3 = PT3 * kPa2Pa + const.Patm; clear PT3;  % [Pa] stagnation temperature
P4 = P4 * kPa2Pa + const.Patm;
Po5 = PT5 * kPa2Pa + const.Patm; clear PT5;  % [Pa] stagnation temperature
Po8 = PT8 * kPa2Pa + const.Patm; clear PT8;  % [Pa] stagnation temperature

clear RPM2rads; clear kPa2Pa; clear lbf2N; clear TOil;