function [P,Po,M,V,T,To] = productsStations_5_8(m_dot,A,Tm,Po,RF,AF)

% Finds station properties for all given spool speeds.

P = zeros(length(Po), 1);
T = zeros(length(Po), 1);
M = zeros(length(Po), 1);
V = zeros(length(Po), 1);

for i = 1:length(Po)
    res = productsStations_5_8_Internal(m_dot(i), A, Tm(i), Po(i), RF,AF(i)); % Obtain the values for one spool speed
    
    P(i) = res.P;
    T(i) = res.T;
    M(i) = res.M;
    V(i) = res.V;
    Po(i) = res.Po;
    To(i) = res.To;
end

end

% Note, uses constant k at measured thermocouple temperature
function [res] = productsStations_5_8_Internal(m_dot, A, Tm, Po, RF, AF)
% Iterative procedure to determine MFP, To, M, and T
% Notes: Will not work if flow is supersonic

% % Constants
T_error = 0.1;
To_error = 0.1;
M_inc = 0.0001;


[Cp,Cv,k] = specHeatC123H222(AF,Tm);
R = Cp - Cv; % J/(kg*K)

% (a) Assume To = Tm
To = Tm;
while (true) % Loop to find correct To
    
    % (b) Calculate MFP using Eq. (1)
    MFP = (m_dot / A) * (sqrt(R*To) / Po); % Equation 1
    
    %==========================================================================
    % (c) Determine T, Po/P and M that satisfy Eqs. (2), (3), and (4)
    % Iterative procedure to determine T, Po/P, and M that satisfy Eqs. (2),
    % (3), (4)
    
    % (c1) Assume T
    T = 300; % Initial guess for T
    while (true)
        [~, ~, k] = specHeatC123H222(AF,T); % Calculate k based on temp
        
        % (c2) Evaluate the integrals, I1 and I2, and Cp,ave
        % Calculate first integration
        I1 = 0;
        dT = 0.1;
        for Ti = T:dT:To
            [cp, ~, ~] = specHeatC123H222(AF,Ti);
            I1 = I1 + cp*dT;
        end
        cp_ave = I1 / (To - T);
        
        % Calculate second integration
        I2 = 0;
        dT = 0.1;
        for Ti = T:dT:To
            [cp, ~, ~] = specHeatC123H222(AF,Ti);
            I2 = I2 + cp/Ti*dT;
        end
        
        
        % (c3) Calculate Po/P via Eq. (2)
        Po_P = exp(I2);
        
        % (c4) Determine M that satisfies Eq. (3)
        M = M_inc; % Assume M
        while (true) % Iteration to find M correct M value
            MFP_guess = (M * sqrt(k) / (Po_P)) * (1 + k*R/(2*cp_ave)*M^2)^0.5;
            if (MFP_guess > MFP)
                break
            elseif (M >= 1)
                break
            end
            M = M + M_inc;
        end
        
        % (c5) Calculate T via Eq. (4).
        % If this value agrees with the assumed value, this is the answer. If it
        % does not, use this calculated value as the next guess for T and repeat
        % from (c2).
        T_new = Tm / (1 + RF*k*R/(2*cp_ave)*M^2)
        
        if (abs(T_new - T)  < T_error)
            break
        else
            T = T_new; % Set calculated value as new temperature
        end
    end
    %==========================================================================
    
    % (d) Calculate To using Eq. (5)
    To_new = T * (1 + k*R/(2*cp_ave) * M^2);
    
    if (abs(To_new - To) < To_error)
        break
    else
        To = To_new;
    end
end

res.T = T;
res.To = To;
res.M = M;
res.MFP = MFP;
res.Po_P = Po_P;
res.Po = Po;
res.P = 1/Po_P * Po;
res.V = M*sqrt(k*R*T);

end

