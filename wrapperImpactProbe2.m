function [P, Po, Po_P, M, V, T, To] = wrapperImpactProbe2(m_dot, A, Tm, Po, RF)
    % Finds station properties for all given spool speeds.
    % Differs from wrapperImpactProbe in that it also outputs Po_P for
    % iteration purposes.
   
    P = zeros(length(Po), 1);
    T = zeros(length(Po), 1);
    M = zeros(length(Po), 1);
    V = zeros(length(Po), 1);
    Po_P = zeros(length(Po), 1);
    
    for i = 1:length(Po)
        res = impactProbeData(m_dot(i), A, Tm(i), Po(i), RF); % Obtain the values for one spool speed
        
        P(i) = res.P;
        T(i) = res.T;
        M(i) = res.M;
        V(i) = res.V;
        Po(i) = res.Po;
        To(i) = res.To;
        Po_P(i) = res.Po_P;
    end


end