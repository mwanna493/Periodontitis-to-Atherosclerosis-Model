function dL = dLdt(t, L, A, M)
% Rate of oxLDL change in arterial intima per day (arbitrary units)

% Model:
%   dL/dt = (alpha_base + alpha_ox * A) * LDL_plasma - delta_L * L - gamma_ML * M * L

%   Influx: LDL clossing the endothelium and being oxidised
%       alpha_base * LDL plasma is crossing endothelium
%       alpha_ox * A * LDL plasma is the oxidation of LDL upregulated by acute phase proteins
%   Clearance: first order passive clearance with rate delta_L
%   Uptake: macrophage uptake of LDL


global alpha_base alpha_ox LDL_plasma delta_L gamma_ML

    influx   = (alpha_base + alpha_ox * A) * LDL_plasma;
    clearance = delta_L  * L;
    uptake    = gamma_ML * M * L;

    dL = influx - clearance;
end