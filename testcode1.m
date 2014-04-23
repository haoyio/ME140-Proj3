m_dot = 0.1332;
A = const.A5;
Tm = 773.3471;
Po = 1.0618e5;
RF = const.RF_ax;
AF = 62.4065;

[P5, Po5, M5, V5, T5, To5] = impactProbeStations_3_5_8(m_dot,A,Tm,Po,RF);
[P5c, Po5c, M5c, V5c, T5c, To5c] = productsStations_5_8(m_dot,A,Tm,Po,RF,AF);