function dF = dFdt(t, F, M, L)
% Rate of foam cell population change in arterial intima per day (cells/mm^3/day)

% Model:
%   dF/dt = k_MF * M * L  -  delta_F * F

%   Production: macrophages that uptake oxLDL become foam cells
%   Removal:  first order egress and death of foam cells with rate delta_F

global k_MF delta_F

    production = k_MF * M * L;
    removal = delta_F * F;

    dF = production - removal;
end