function B = B0(t)
% B(t) represents disease severity over time. Modes:
%   'chronic'   constant elevated load
%   'step'      healthy -> diseased at t = params.B_onset (days)%

% 0 = healthy, 1 = severe periodontitis

global B_mode B_healthy B_disease B_onset

    switch B_mode

        case 'chronic'
            B = B_disease;

        case 'step'
            if t < B_onset
                B = B_healthy;
            else
                B = B_disease;
            end
    end
end