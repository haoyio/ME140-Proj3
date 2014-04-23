

clc; close all; clear all;

T1 = 300;
P1 = 101325;
i = 1;
k = 1.4;
FA = 1/70;
m_dot_a = 0.2;
m_dot_f = FA * m_dot_a;

Q = 42.8e6 * m_dot_f;
cp = 1005;
eff_comp = 1;
eff_turb = 1;

for P2_P1 = 2:.1:10

    P2_P1_data(i) = P2_P1;
    P2 = P2_P1 * P1;
    
    T2s_T1 = (P2_P1)^((k-1)/k);
    T2s = T2s_T1 * T1;
    T2 = (T2s - T1) / eff_comp + T1;
    W_comp = cp*m_dot_a*(T2-T1);
    
    T3 = Q/(m_dot_a*cp);
    T4 = T3 - W_comp/(m_dot_a*cp);
    P3 = P2;
    T4s = T3 - (T3 - T4)/eff_turb;
    P4_P3 = (T4s/T3)^(k/(k-1));
    P4(i) = P4_P3 * P3 / 1000;
    
    i = i + 1;
end

plot(P2_P1_data, P4);
xlabel('Pressure ratio across compressor')
ylabel('Pressure out of turbine (kPa)')
title('Plot of pressure vs. pressure ratio for Brayton Cycle')
