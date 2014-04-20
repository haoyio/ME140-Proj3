function M = isentropic_P_P0_in_M_out(P_P0,k)
M = fsolve(@(M) (1+(k-1)/2*M^2)^(-k/(k-1)) - P_P0,[0.5], optimset('Display','off'));
end