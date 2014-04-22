function [P, Po, M, V, T, To] = impactProbeStation_4(m_dot, A, Tm, P, RF)
% Inputs arrays, outputs arrays
% Handles all the array complications for different spool speeds

numDataPoints = 8;

Po = zeros(1,numDataPoints);
M = zeros(1,numDataPoints);
V = zeros(1,numDataPoints);
T = zeros(1,numDataPoints);
To = zeros(1,numDataPoints);

for i = 1:numDataPoints
    [P(i), Po(i), M(i), V(i), T(i), To(i)] =...
        station4(m_dot(i), A, Tm(i), P(i), RF);  
end

end

function [P, Po, M, V, T, To] = station4(m_dot, A, Tm, P, RF)
% Iterative procedure to determine MFP, To, M, and T

M = 0;
T = 0;
To = Tm;
Po = P;
[Cp,Cv,k] = specHeat(Tm);
R = Cp - Cv;

dP = 1;
dT = 0.01;



while(true)
    while(true)
        MFP = m_dot/A*sqrt(R*To)/Po;
        M = fsolve( @(M) M*sqrt(k)*(1+(k-1)/2*M^2)^...
            (-(k+1)/(2*(k-1))) - MFP,[0.1],...
            optimset('Display','off'));
        Po_P = (1+(k-1)/2*M^2)^((k-1)/k);
        Po_new = Po_P * P;
        if( abs((Po_new-Po)/Po) < 1e-3 )
            Po = Po_new;
            break;
        end
    end
    To_Tm = (1+(k-1)/2*M^2)/(1+RF*(k-1)/2*M^2);
    To_new = To_Tm * Tm;
    if( abs((To_new-To)/To) < 1e-3 )
        To = To_new;
        break;
    end
    [Cp,Cv,k] = specHeat(T);
    T = Tm / (1+RF*(k-1)/2*M^2);

end

[~,~,k] = specHeat(Tm);
T = Tm / (1+RF*(k-1)/2*M^2);
V = M * sqrt(k*R*T);

end