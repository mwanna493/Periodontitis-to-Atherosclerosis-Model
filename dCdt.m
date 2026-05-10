function dC = dCdtC(t, C, B)
% Rate of Cytokine concentration change in pg/ml/day

% Model:
%   dC/dt = lambda_C * B  -  delta_C * C

%   Production: proportional to oral bacterial load B(t)
%   Decay: first-order clearance with rate delta_C


global lambda_C delta_C

    production = lambda_C * B;
    decay = delta_C  * C;

    dC = production - decay;
end