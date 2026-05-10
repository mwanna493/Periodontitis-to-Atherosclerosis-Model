clear all %clear all variables
clf       %and figures

global dt t_end klokmax;
global C A L M F P
global B_mode B_healthy B_disease B_onset
global lambda_C delta_C
global k_AC delta_A
global sigma_M delta_M k_MF
global alpha_base alpha_ox LDL_plasma delta_L gamma_ML
global k_MF delta_F
global F_thresh k_stenosis

init_params; 

t_plot = zeros(1, klokmax);
B_plot = zeros(1, klokmax);
C_plot = zeros(1, klokmax);
A_plot = zeros(1, klokmax);
L_plot = zeros(1, klokmax);
M_plot = zeros(1, klokmax);
F_plot = zeros(1, klokmax);
P_plot = zeros(1, klokmax);


for klok = 1:klokmax
    t = klok * dt;
 
    B = B0(t); %Oral disease input
 
    dC = dCdt(t, C, B);
    dA = dAdt(t, A, C);
    dL = dLdt(t, L, B, A);
    dM = dMdt(t, M, L);
    dF = dFdt(t, F, M, L);
 
    C = C + dt * dC;
    A = A + dt * dA;
    L = L + dt * dL;
    M = M + dt * dM;
    F = F + dt * dF;

    P = P + dt * max(0, F - F_thresh); %Plaque size
 
    t_plot(klok) = t;
    B_plot(klok) = B;
    C_plot(klok) = C;
    A_plot(klok) = A;
    L_plot(klok) = L;
    M_plot(klok) = M;
    F_plot(klok) = F;
    P_plot(klok) = P;
end

stenosis_plot = k_stenosis * P_plot;
stenosis_plot = min(stenosis_plot, 100);



t_years = t_plot / 365;
 
% Periodontitis Plot
title('Periodontitis Variables')
 
subplot(3,1,1)
plot(t_years, B_plot, 'k')
xlabel('Time (years)')
ylabel('B(t)')
title('Bacterial in Periodontal Pocket')
 
subplot(3,1,2)
plot(t_years, C_plot)
xlabel('Time (years)')
ylabel('C(t)  (pg/mL)')
title('Cytokines')
 
subplot(3,1,3)
plot(t_years, A_plot)
xlabel('Time (years)')
ylabel('A(t)  (mg/L)')
title('Acute Phase Proteins')
 
% Atherosclerosis Variables
figure(2)
title('Atherosclerosis Variables')
 
subplot(3,1,1)
plot(t_years, L_plot)
xlabel('Time (years)')
ylabel('L(t)')
title('Oxidised LDL')
 
subplot(3,1,2)
plot(t_years, M_plot)
xlabel('Time (years)')
ylabel('M(t)  [cells/mm^3]')
title('Macrophages')
 
subplot(3,1,3)
plot(t_years, F_plot)
xlabel('Time (years)')
ylabel('F(t)  [cells/mm^3]')
title('Foam Cells')
 
% Cardiac Outcomes
figure(3)
title('Cardiac outcomes')
 
subplot(2,1,1)
plot(t_years, P_plot)
ylabel('P(t)')
title('Plaque Size')
 
subplot(2,1,2)
plot(t_years, stenosis_plot)
yline(70, 'k--', 'Critical threshold (70%)', 'LabelHorizontalAlignment', 'left')
xlabel('Time (years)')
ylabel('Stenosis (%)')
title('Estimated Lumen Stenosis')
ylim([0 105])
 