function dA = dAdt(t, A, C)
% Rate of Acute Phase Protein concentration change in mg/L/day

% Model:
%   dA/dt = k_AC * C  -  delta_A * A

%   Production: acute phase proteins are produced in response to cytokine signalling
%   Decay:      first-order clearance with rate delta_A

global k_AC delta_A

    production = k_AC   * C;
    decay = delta_A * A;

    dA = production - decay;
end