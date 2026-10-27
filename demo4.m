%##########################################################################
% EXPERIENCE 4 (article, Section V-B) : Fig. 6
% Variantes cardinality-aware (ZPCR6, JPCR6, SZPCR6, SJPCR6) vs PCR6
% Influence du nombre de sources, |Theta| = 4 fixé
%
% NOTE : comme pour l'Expérience 2, l'article ne donne pas les BBA
% exactes ; masses aléatoires générées avec graine FIXE (rng(1)).
%##########################################################################
clc; clear;
rng(1);

time_PCR6   = [];
time_ZPCR6  = [];
time_JPCR6  = [];
time_SZPCR6 = [];
time_SJPCR6 = [];

Max_sources = 6;
FoD_size = 4;
focal_element_number = 4;

fprintf('%-10s %-10s %-10s %-10s %-10s %-10s\n', ...
    'sources','PCR6','ZPCR6','JPCR6','SZPCR6','SJPCR6');

for i = 2:1:Max_sources
    MasseIn = Generate_Masses(i, 2^FoD_size, focal_element_number);

    tic; PCR6(MasseIn);    t_pcr6   = toc;
    tic; ZPCR6(MasseIn);   t_zpcr6  = toc;
    tic; JPCR6(MasseIn);   t_jpcr6  = toc;
    tic; SZPCR6(MasseIn);  t_szpcr6 = toc;
    tic; SJPCR6(MasseIn);  t_sjpcr6 = toc;

    time_PCR6   = [time_PCR6;   i t_pcr6];
    time_ZPCR6  = [time_ZPCR6;  i t_zpcr6];
    time_JPCR6  = [time_JPCR6;  i t_jpcr6];
    time_SZPCR6 = [time_SZPCR6; i t_szpcr6];
    time_SJPCR6 = [time_SJPCR6; i t_sjpcr6];

    fprintf('%-10d %-10.4f %-10.4f %-10.4f %-10.4f %-10.4f\n', ...
        i, t_pcr6, t_zpcr6, t_jpcr6, t_szpcr6, t_sjpcr6);
end

figure('Name','Fig. 6 - Variantes PCR6 selon le nombre de sources');
plot(time_ZPCR6(:,1),  time_ZPCR6(:,2),  'r-o', 'LineWidth',0.5,'MarkerSize',8); hold on;
plot(time_JPCR6(:,1),  time_JPCR6(:,2),  'r-+', 'LineWidth',0.5,'MarkerSize',8);
plot(time_SJPCR6(:,1), time_SJPCR6(:,2), 'r-s', 'LineWidth',0.5,'MarkerSize',8);
plot(time_SZPCR6(:,1), time_SZPCR6(:,2), 'r-p', 'LineWidth',0.5,'MarkerSize',8);
plot(time_PCR6(:,1),   time_PCR6(:,2),   'b-o', 'LineWidth',0.5,'MarkerSize',8);
xlabel('Number of masses');
ylabel('time');
legend({'Time(ZPCR6)','Time(JPCR6)','Time(SJPCR6)','Time(SZPCR6)','Time(PCR6)'}, 'Location','northwest');
grid on; box on;
title('Execution time of ZPCR6, JPCR6, SZPCR6, SJPCR6, and PCR6');