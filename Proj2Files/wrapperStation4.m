function [P, Po, M, V, T, To] = wrapperStation4(m_dot, A, Tm, P, RF)
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