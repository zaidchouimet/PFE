%##########################################################################
% EXPERIENCE 2 (article, Section V-B) : Fig. 4
% Influence du nombre de sources sur PCR6 (originale vs optimisée)
% |Theta| = 4 fixé
%
% NOTE : l'article ne donne pas les BBA exactes pour cette expérience
% (seulement le principe : cadre fixé à 4, sources de 2 à 6).
% On utilise donc des masses aléatoires générées avec une graine FIXE
% (rng(1)) pour que les résultats soient reproductibles.
%##########################################################################
clc; clear;
rng(1);   % graine fixe pour la reproductibilité

PCR6_time = [];
PCR6_optimized_time = [];

Max_sources = 4;
FoD_size = 4;
focal_element_number = 4;

fprintf('%-10s %-18s %-18s\n','sources','Original (s)','Optimisée (s)');

for i = 2:1:Max_sources
    MasseIn = Generate_Masses(i, 2^FoD_size, focal_element_number);

    tic; M_PCR6_old = PCR6(MasseIn);           t_original  = toc;
    tic; M_PCR6_new = PCR6_Optimized(MasseIn); t_optimized = toc;

    PCR6_time           = [PCR6_time;           i t_original];
    PCR6_optimized_time = [PCR6_optimized_time;  i t_optimized];

    fprintf('%-10d %-18.5f %-18.5f\n', i, t_original, t_optimized);
end

figure('Name','Fig. 4 - Influence du nombre de sources');
plot(PCR6_time(:,1), PCR6_time(:,2), 'r-s', 'LineWidth',0.5,'MarkerSize',10); hold on;
plot(PCR6_optimized_time(:,1), PCR6_optimized_time(:,2), 'b-o', 'LineWidth',0.5,'MarkerSize',10);
xlabel('Number of masses');
ylabel('time');
legend({'Time (PCR6)','Time (PCR6 - New Implementation)'}, 'Location','northwest');
grid on; box on;
title('Execution time of PCR6 with varied numbers of sources');