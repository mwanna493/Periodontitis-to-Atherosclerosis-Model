function dM = dMdt(t, M, L)
% Rate of macrophage population change in arterial intima per day (cells/mm^3/day)

%   Influx: LDL clossing the endothelium and being oxidised
%       alpha_base * LDL plasma is crossing endothelium
%       alpha_ox * A * LDL plasma is the oxidation of LDL upregulated by acute phase proteins
%   Clearance: first order passive clearance with rate delta_L
%   Uptake: macrophage uptake of LDL
% ODE_M  Rate of change of intimal macrophage population M(t)
%
% Represents: monocyte-derived macrophages recruited to the intima
%
% Model:
%   dM/dt = sigma_M * L  -  delta_M * M  -  k_MF * M * L
%
%   Recruitment: macrophages recruited in response to oxLDL
%   Turnover: first order natural macrophage death and egress with rate delta_M
%   Conversion: macrophages that uptake oxLDL and become foam cells

global sigma_M delta_M k_MF

    recruitment = sigma_M * L;
    turnover = delta_M * M;
    conversion = k_MF * M * L;

    dM = recruitment - turnover - conversion;
end