clear all;

x20 = [10 15  20 ];
x22 = [10 15  20  22 ];
x25 = [10 15  20  22  25 ];
x27 = [10 15  20  22  25  27 ];
x35 = [10 15  20  22  25  27  30  32  35 ];
x40 = [10 15  20  22  25  27  30  32  35  37  40];

x = [0 5 10 15 20 25 50 100 200 ];

% for j in NK ZKC ZKW; do for i in brute bab dynamic fptas1 fptas3 fptas5 greedy redux; do echo "${j}${i} = importdata('${j}_summary_${i}', ';');"; done; done


% GPbrute  = importdata('brute-11-100_(w1000c1000)[m0.8wbalcunik1]_summary', ';');
% GPredux  = importdata('redux-11-100_(w1000c1000)[m0.8wbalcunik1]_summary', ';');

% GPbab    = importdata('bab-15-100_(w1000c1000)[m0.8wbalcunik1]_summary', ';');
% GPdynamic= importdata('dynamic-15-100_(w1000c1000)[m0.8wbalcunik1]_summary', ';');



GPbab    = importdata('bab-10-100_(w1000c1000)[m0.8wbalcunik1]_summary', ';');
GPdynamic= importdata('dynamic-10-100_(w1000c1000)[m0.8wbalcunik1]_summary', ';');


width = 2;
max = 2;
avg = 3;

plot(x, GPdynamic(:,max),'-x', 'LineWidth', width ,'color', [0.4940 0.1840 0.5560]); hold on
plot(x, GPdynamic(:,avg),'-o', 'LineWidth', width ,'color', [0.4940 0.1840 0.5560]); hold on

% plot(x, GPbab(:,   max), '-x', 'LineWidth', width ,'color', [0.8500 0.3250 0.0980]); hold on
% plot(x, GPbab(:,   avg), '-o', 'LineWidth', width ,'color', [0.8500 0.3250 0.0980]); hold on

% ----- ZKC -----
% semilogy(x, GPbrute(:, max), '-x', 'LineWidth', width ,'color', [0.6350 0.0780 0.1840]); hold on
% plot(x, GPbab(:,   max), '-x', 'LineWidth', width ,'color', [0.8500 0.3250 0.0980]); hold on
% plot(x, GPdynamic(:,max),'-x', 'LineWidth', width ,'color', [0.4940 0.1840 0.5560]); hold on
% semilogy(x, GPredux(:, max), '-x', 'LineWidth', width ,'color', [0.4660 0.6740 0.1880]); hold on

% semilogy(x, GPbrute(:, avg), '-o', 'LineWidth', width ,'color', [0.6350 0.0780 0.1840]); hold on
% plot(x, GPbab(:,   avg), '-o', 'LineWidth', width ,'color', [0.8500 0.3250 0.0980]); hold on
% plot(x, GPdynamic(:,avg),'-o', 'LineWidth', width ,'color', [0.4940 0.1840 0.5560]); hold on
% semilogy(x, GPredux(:, avg), '-o', 'LineWidth', width ,'color', [0.4660 0.6740 0.1880]); hold on

grid

% title('Složitost')
% subtitle('pro metodu větví a hranic')
% legend('FPTAS (0.1) max','FPTAS (0.3) max','FPTAS (0.5) max', 'Greedy max', 'Redux max', 'B&B max', 'Brute max', 'FPTAS (0.1) avg','FPTAS (0.3) avg','FPTAS (0.5) avg', 'Greedy avg', 'Redux avg', 'B&B avg', 'Brute avg')
% legend('FPTAS (0.1) max','FPTAS (0.5) max', 'Greedy max', 'Redux max', 'B&B max', 'Brute max', 'FPTAS (0.1) avg','FPTAS (0.5) avg', 'Greedy avg', 'Redux avg', 'B&B avg', 'Brute avg')
% legend('brute max','bab max', 'Dynamic cost max', 'Redux max', 'brute avg','bab avg','Dynamic cost avg', 'Redux avg')

% legend('bab max', 'bab avg')
legend('Dynamic cost max','Dynamic cost avg')

ylabel('Složitost')
xlabel('Permutací')
hold off
