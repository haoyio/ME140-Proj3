function [res] = impactProbeData(m_dot, A, Tm, Po, RF)
% Iterative procedure to determine MFP, To, M, and T
% Notes: Will not work if flow is supersonic

% Constants
R = 287.058; % J/(kg*K)
molarMass = 0.02897; % kg/mole
MFP_error = 0.01;
T_error = 0.1;
To_error = 0.1;
M_inc = 0.0001;
T_inc = 0.1;
To_inc = 0.1;
T_steps = 10000;

a = 2.927;
b = 1.488e-3;
c = -5.685e-7;
d = 1.01e-10;
e = -6.753e-15;

R = 287.058; % J/(kg*K)

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
        [~, ~, k] = specHeat(T); % Calculate k based on temp
        
        % (c2) Evaluate the integrals, I1 and I2, and Cp,ave
        % Calculate first integration
        I1 = (a*(To - T) + b/2*(To^2 - T^2) + c/3*(To^3 - T^3) + d/4*(To^4 - T^4) + e/5*(To^5-T^5)) * R;
        cp_ave = I1 / (To - T);
        
        % Calculate second integration
        I2 = (a*log(To/T) + b*(To - T) + c/2*(To^2 - T^2) + d/3*(To^3 - T^3) + e/4*(To^4-T^4));
        
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
        T_new = Tm / (1 + RF*k*R/(2*cp_ave)*M^2);
        
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

