clear;

%{
    Code to exhibit conceptual relationship between greater
    heat released by fuel combustion and outlet velocity, which
    directly relates to thrust output.
%}

% --- Consider a generic engine between stages 2 and 5 --- %

% Constants
k = const.k;
cp = const.Cp;

% Known/fixed values for generic engine
To2 = 300;      % inlet stagnation temperature constant
Po3_Po2 = 1.4;  % fixed pressure ratio across compressor
Po2_Po0 = 0.99; % fixed pressure recovery factor
Po0 = 1.5e5;    % fixed inlet stagnation pressure

% Control input is heat released from fuel combustion (Q)
% But we're really controlling To4 (given To3), so WLOG we
% can just assume we have direct control over To4
To4 = 900:1:1600;   % range of TITs for our conceptual example

% Compute Po5 and see how it varies with Q (To4)
To3 = To2*Po3_Po2^((k-1)/k);
Po4 = Po0*Po2_Po0*Po3_Po2;
Po5 = Po4*((To4 - To3 + To2)./To4).^(k/(k-1));
Q = cp*(To4 - To3);

% Visualize relationship between Q and Po5
% Notice that as Q increases Po5 increases, and that if
% Po5 increases we have, for the same isentropic nozzle,
% greater exit flow velocity, giving us greater thrust
figure;
plot(Q/1e6, Po5/1e3);
title('Heat from fuel combustion vs P_{O5}');
xlabel('Q [MJ/kg]');
ylabel('Po5 [kPa]');
plotfixer;
