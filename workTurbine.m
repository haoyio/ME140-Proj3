function [To5 w_turb] = workTurbine(To4, Po5_Po4, AF)
% Figures out the work across a turbine with a mixture.

[cp cv k] = specHeatC123H222(AF, To4);
R = cp - cv; % J/kg*K
dT = -0.01; % K
To5 = To4; % K

RHS = R*log(Po5_Po4);
LHS = 0;
w_turb = 0; % J/kg

while (true)
    [cp_1, ~, ~] = specHeatC123H222(AF, To5); % Calculate cp at temperature
    [cp_2, ~, ~] = specHeatC123H222(AF, To5 + dT); % Calculate cp at next temp
    
   	y_1 = cp_1 / To5; % Evaluate function at current temp
    y_2 = cp_2 / (To5 + dT); % Evaluate function at next temp
    
    y_ave = (y_1 + y_2) / 2; % Use trapezoid method to evlauate y_ave
    
    LHS = LHS + y_ave*dT; % Add the next part of the integral
    w_turb = w_turb + (cp_1 + cp_2) / 2 * dT; % Calculate specific work based on cp integral
    
    if (LHS < RHS) % Exceeded what we need -> break
        break
    end
    
    To5 = To5 + dT;
end
    w_turb = -w_turb;
end