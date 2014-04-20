function MFP = isentropic_MFP_out_M_in(M,k)
MFP = M*k^0.5*(1+((k-1)/2)*M^2)^(-(k+1)/(2*(k-1)));
end