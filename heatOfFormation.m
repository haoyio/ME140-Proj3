clc; clear all; close all;

% Script to figure out the heat of formation of C12.3H22.2

hf_CO2 = -393520; % J/mole
hf_H2O_lq = -285830; % J/mole
hf_H2O_g = -241820;
Nmoles_CO2 = 12.3;
Nmoles_H2O = 11.1;
Nmoles_C123H222 = 1;
M_C123H222 = 0.170;
Nmoles_O2 = 17.85;
Nmoles_N2 = Nmoles_O2 * 3.76;
Nva = Nmoles_CO2 + Nmoles_N2;

LHV_kg = 42.8e6; % J/mole
LHV_mole = LHV_kg * M_C123H222;
Psat = 3169.8; % Pa
Pm = 101325; % Pa
y_max = Psat / Pm;


Nv2 = (Nva*y_max)/(1-y_max)
Nl2 = Nmoles_H2O - Nv2

Nmoles_CO2*hf_CO2
Nv2*hf_H2O_g
Nl2*hf_H2O_lq
Nmoles_C123H222*LHV_mole

hf_surr_mole = (Nmoles_CO2*hf_CO2 + Nmoles_H2O*hf_H2O_g + LHV_mole) % J/mole
hf_surr_kg = hf_surr_mole / M_C123H222





