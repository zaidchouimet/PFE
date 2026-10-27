%##########################################################################
% EXPERIENCE 1 (article, Section V-A/B) : Tableau I + Fig. 3
% Influence de |Theta| sur PCR6 (originale vs optimisée)
%
% Configuration EXACTE de l'article :
%   m1(h1) = 0.5      m1(Theta \ {h1}) = 0.5
%   m2(h2) = 0.5      m2(h1 U h3)      = 0.5
%##########################################################################
clc; clear;

Theta_values = 3:8;

PCR6_time = [];
PCR6_optimized_time = [];

fprintf('%-8s %-18s %-18s\n','|Theta|','Original (s)','Optimisée (s)');

for n = Theta_values
    power_set_size = 2^n;

    idx_h1             = 1 + 2^(1-1);
    idx_h2              = 1 + 2^(2-1);
    idx_h1_union_h3     = 1 + 2^(1-1) + 2^(3-1);
    idx_Theta_minus_h1  = power_set_size - 1;

    m1 = zeros(power_set_size,1);
    m1(idx_h1)             = 0.5;
    m1(idx_Theta_minus_h1) = 0.5;

    m2 = zeros(power_set_size,1);
    m2(idx_h2)          = 0.5;
    m2(idx_h1_union_h3) = 0.5;

    assert(abs(sum(m1)-1) < 1e-9, 'm1 mal formée pour |Theta|=%d', n);
    assert(abs(sum(m2)-1) < 1e-9, 'm2 mal formée pour |Theta|=%d', n);

    MasseIn = [m1 m2];

    tic; M_PCR6 = PCR6(MasseIn);             t_original  = toc;
    tic; M_PCR6_Optimized = PCR6_Optimized(MasseIn); t_optimized = toc;

    PCR6_time           = [PCR6_time;           n t_original];
    PCR6_optimized_time = [PCR6_optimized_time;  n t_optimized];

    fprintf('%-8d %-18.5f %-18.5f\n', n, t_original, t_optimized);
end

% Tableau I
T = table(PCR6_time(:,1), PCR6_time(:,2), PCR6_optimized_time(:,2), ...
    'VariableNames', {'Theta','Original_s','Optimized_s'});
disp(T);

% Fig. 3
figure('Name','Fig. 3 - Influence de |Theta|');
plot(PCR6_time(:,1), PCR6_time(:,2), 'r-s', 'LineWidth',0.5,'MarkerSize',10); hold on;
plot(PCR6_optimized_time(:,1), PCR6_optimized_time(:,2), 'b-o', 'LineWidth',0.5,'MarkerSize',10);
xlabel('size of the frame of discernment (|\Theta|)');
ylabel('time');
legend({'Time (PCR6)','Time (PCR6 - New Implementation)'}, 'Location','northwest');
grid on; box on;
title('Execution time of PCR6 while varying the size of \Theta');