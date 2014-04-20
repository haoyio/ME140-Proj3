function [thrust_calc, specific_thrust, TSFC, eta] =...
    part3(mdot, mdot_fuel, v_out, LHV)
%part 3 This function calculates the specific thrust, TSFC and thermal
%efficiency using the mass flow rate of air and fuel, engine exhaust
%velocity, the lower heating value for the fuel used and engine thrust.

%Calculate calculated thrust.
thrust = mdot .* v_out;

%Calculate specific thrust and TSFC according to the formulas.
specific_thrust = thrust ./ mdot;
TSFC = mdot_fuel ./ thrust;

%Calculate the power produced by the engine.
P = 0.5 .* thrust .* v_out; %Inlet velocity is 0 since engine is stationary.

%Calculate the thermal energy going into the engine.
Q = LHV .* mdot_fuel;

%Calculate the thermal efficiency based on the power and the thermal energy
eta = P ./ Q;

thrust_calc = thrust;
end

