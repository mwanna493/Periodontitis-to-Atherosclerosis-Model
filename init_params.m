
% References for parameter estimates:
%   Cytokine dynamics:   Waage et al. 1989, Gabay & Kushner 1999
%   oxLDL / macrophage:  Chalmers et al. 2015 (PMID 20440571)
%   Foam cell dynamics:  Ibragimov et al. 2005
%   CRP-LDL link:        Blake & Ridker 2002

dt    = 1;       % time step (days)
t_end = 7300;    % total duration = 20 years
klokmax = t_end / dt; % total number of time steps

% Initial conditions
C = 2.0;    % baseline IL-6 ~2 pg/mL (healthy)
A = 1.0;    % baseline CRP ~1 mg/L (healthy)
L = 0.01;   % near-zero intimal oxLDL at t=0
M = 0.01;   % near-zero intimal macrophages at t=0
F = 0.0;    % no foam cells initially
P = 0; 

% B(t) input
B_mode = 'step';   % 'chronic' or 'step'
B_healthy  = 0.05;     % low baseline (healthy gums)
B_disease  = 1.0;      % normalised severe periodontitis load
B_onset    = 365;      % disease begins at year 1 (days)

% C(t) parameters
lambda_C = 3.0;    % cytokine induction rate per unit B (pg/mL/day)
delta_C  = 0.15;   % cytokine decay rate (1/day); half-life ~5 days

% A(t) parameters
k_AC    = 0.05;    % CRP induction rate per unit C (mg/L / pg/mL / day)
delta_A = 0.02;    % CRP decay rate (1/day); half-life ~35 days

% L(t) parameters
alpha_base  = 0.001;   % baseline intimal LDL influx (1/day)
alpha_ox    = 0.003;   % extra oxLDL induction per unit A (CRP-driven)
LDL_plasma  = 1.0;     % plasma LDL (normalised; set <1 for statin treatment)
delta_L     = 0.05;    % oxLDL clearance rate (1/day)
gamma_ML    = 0.1;     % macrophage-mediated oxLDL uptake rate

% M(t) parameters
sigma_M  = 0.5;    % macrophage recruitment rate per unit L (1/day)
delta_M  = 0.03;   % macrophage turnover rate (1/day); ~33 day lifespan
k_MF     = 0.2;    % rate of macrophage -> foam cell conversion per L

% F(t) parameters
delta_F  = 0.005;  % foam cell removal rate (1/day); slow — plaque persists

% P(t) parameters
F_thresh    = 0.5;     % homeostatic foam cell threshold; excess -> plaque
k_stenosis  = 0.01;   % linear scaling: P units -> stenosis %