%##########################################################################
% EXPERIENCE 3 (article, Section V-B) : Fig. 5
% Variantes cardinality-aware (ZPCR6, JPCR6, SZPCR6, SJPCR6) vs PCR6
% Influence de |Theta|, même configuration que l'Expérience 1
%##########################################################################
clc; clear;

Theta_values = 3:11;

time_PCR6   = [];
time_ZPCR6  = [];
time_JPCR6  = [];
time_SZPCR6 = [];
time_SJPCR6 = [];

fprintf('%-8s %-10s %-10s %-10s %-10s %-10s\n', ...
    '|Theta|','PCR6','ZPCR6','JPCR6','SZPCR6','SJPCR6');

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

    MasseIn = [m1 m2];

    tic; DST(MasseIn,8); t_pcr6   = toc;
    tic; ZPCR6(MasseIn); t_zpcr6  = toc;
    tic; JPCR6(MasseIn); t_jpcr6  = toc;
    tic; SZPCR6(MasseIn); t_szpcr6 = toc;
    tic; SJPCR6(MasseIn); t_sjpcr6 = toc;

    time_PCR6   = [time_PCR6;   n t_pcr6];
    time_ZPCR6  = [time_ZPCR6;  n t_zpcr6];
    time_JPCR6  = [time_JPCR6;  n t_jpcr6];
    time_SZPCR6 = [time_SZPCR6; n t_szpcr6];
    time_SJPCR6 = [time_SJPCR6; n t_sjpcr6];

    fprintf('%-8d %-10.4f %-10.4f %-10.4f %-10.4f %-10.4f\n', ...
        n, t_pcr6, t_zpcr6, t_jpcr6, t_szpcr6, t_sjpcr6);
end

figure('Name','Fig. 5 - Variantes PCR6 selon |Theta|');
plot(time_ZPCR6(:,1),  time_ZPCR6(:,2),  'r-o', 'LineWidth',0.5,'MarkerSize',8); hold on;
plot(time_JPCR6(:,1),  time_JPCR6(:,2),  'r-+', 'LineWidth',0.5,'MarkerSize',8);
plot(time_SJPCR6(:,1), time_SJPCR6(:,2), 'r-s', 'LineWidth',0.5,'MarkerSize',8);
plot(time_SZPCR6(:,1), time_SZPCR6(:,2), 'r-p', 'LineWidth',0.5,'MarkerSize',8);
plot(time_PCR6(:,1),   time_PCR6(:,2),   'b-o', 'LineWidth',0.5,'MarkerSize',8);
xlabel('size of the frame of discernment (|\Theta|)');
ylabel('time');
legend({'Time(ZPCR6)','Time(JPCR6)','Time(SJPCR6)','Time(SZPCR6)','Time(PCR6)'}, 'Location','northwest');
grid on; box on;
title('Execution time of ZPCR6, JPCR6, SZPCR6, SJPCR6, and PCR6');