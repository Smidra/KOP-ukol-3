clear all;

% for j in NK ZKC ZKW; do for i in brute bab dynamic fptas1 fptas3 fptas5 greedy redux; do echo "${j}${i} = importdata('${j}_summary_${i}', ';');"; done; done

width = 2;
max = 2;
avg = 3;

% babMAXstrong = [118   709   1862    4492   11101];
% babAVGstrong = [58   360   835    2128   5640];
% babMAXcorr =   [148   1002   3048    7268   17628];
% babAVGcorr =   [66   411   1089    2752   7256];
% babMAXuni =    [47   153   281    660    638];
% babAVGuni =    [17   33   51    79     96];
% 
% plot(x, babMAXstrong,'-x', 'LineWidth', width ,'color', [0.8500 0.3250 0.0980]); hold on
% plot(x, babAVGstrong,'-o', 'LineWidth', width ,'color', [0.8500 0.3250 0.0980]); hold on
% plot(x, babMAXcorr, '-x', 'LineWidth', width ,'color', [0.4940 0.1840 0.5560]); hold on
% plot(x, babAVGcorr, '-o', 'LineWidth', width ,'color', [0.4940 0.1840 0.5560]); hold on
% plot(x, babMAXuni,'-x', 'LineWidth', width ,'color', [0.4660 0.6740 0.1880]); hold on
% plot(x, babAVGuni,'-o', 'LineWidth', width ,'color', [0.4660 0.6740 0.1880]); hold on
% legend('strong bab max', 'strong bab avg', 'corr bab max', 'corr bab avg', 'uni bab max', 'uni bab avg')
% ylim([0 6000])



% dynMAXstrong = [2038  18609   36579    60115       84024];
% dynAVGstrong = [1891  16249   31100    49706       72230];
% dynMAXcorr =   [2046  20390   39171    64680       89854];
% dynAVGcorr =   [1899  16338   31383    51208       74144];
% dynMAXuni =    [2046  20069   39573    65772       102133];
% dynAVGuni =    [1902  16791   32308    52770       77564];
% 
% plot(x, dynMAXstrong,'-x', 'LineWidth', width ,'color', [0.8500 0.3250 0.0980]); hold on
% plot(x, dynAVGstrong,'-o', 'LineWidth', width ,'color', [0.8500 0.3250 0.0980]); hold on
% plot(x, dynMAXcorr,  '-x', 'LineWidth', width ,'color', [0.4940 0.1840 0.5560]); hold on
% plot(x, dynAVGcorr,  '-o', 'LineWidth', width ,'color', [0.4940 0.1840 0.5560]); hold on
% plot(x, dynMAXuni,   '-x', 'LineWidth', width ,'color', [0.4660 0.6740 0.1880]); hold on
% plot(x, dynAVGuni,   '-o', 'LineWidth', width ,'color', [0.4660 0.6740 0.1880]); hold on
% legend('strong bab max', 'strong bab avg', 'corr bab max', 'corr bab avg', 'uni bab max', 'uni bab avg')
% ylim([0 60000])



% reduxMAXstrong = [ 19.173474   14.184867    5.961666    9.67971     9.314884 ];
% reduxAVGstrong = [ 10.421805   5.979555     0.767454    4.200750    5.042353 ];
% reduxMAXcorr =   [ 22.675159   14.416651    15.60071    13.75925    10.791576 ];
% reduxAVGcorr =   [ 6.446171    5.165493     4.526299    4.061455    3.760508 ];
% reduxMAXuni =    [ 9.475580    6.375321     5.961666    6.026059    4.693065 ];
% reduxAVGuni =    [ 1.130760    0.710166     0.767454    0.547468    0.564037 ];
% 
% plot(x, reduxMAXstrong,'-x', 'LineWidth', width ,'color', [0.8500 0.3250 0.0980]); hold on
% plot(x, reduxAVGstrong,'-o', 'LineWidth', width ,'color', [0.8500 0.3250 0.0980]); hold on
% plot(x, reduxMAXcorr,  '-x', 'LineWidth', width ,'color', [0.4940 0.1840 0.5560]); hold on
% plot(x, reduxAVGcorr,  '-o', 'LineWidth', width ,'color', [0.4940 0.1840 0.5560]); hold on
% plot(x, reduxMAXuni,   '-x', 'LineWidth', width ,'color', [0.4660 0.6740 0.1880]); hold on
% plot(x, reduxAVGuni,   '-o', 'LineWidth', width ,'color', [0.4660 0.6740 0.1880]); hold on
% legend('strong bab max', 'strong bab avg', 'corr bab max', 'corr bab avg', 'uni bab max', 'uni bab avg')
% ylim([0 25])




x =        [0.1        0.3            0.5          0.7         0.8         0.9          0.99    ];
reduxMAX = [24.741761  14.096405      10.255674    6.338384    4.693065    3.495834     1.969928];
reduxAVG = [5.556875   3.394147       2.204648     0.919452    0.564037    0.319941     0.140695];
reduxMAXsloz = [11.000000   15.000000     17.000000   19.000000   20.000000 21.000000   21.000000    ];
reduxAVGsloz = [6.915000    10.975000     14.070000   17.070000   18.535000 19.920000   21.000000  ];


plot(x, reduxMAX,  '-x', 'LineWidth', width ,'color', [0.4940 0.1840 0.5560]); hold on
plot(x, reduxAVG,  '-o', 'LineWidth', width ,'color', [0.4940 0.1840 0.5560]); hold on
plot(x, reduxMAXsloz,  '-x', 'LineWidth', width ,'color', [0.4660 0.6740 0.1880]); hold on
plot(x, reduxAVGsloz,  '-o', 'LineWidth', width ,'color', [0.4660 0.6740 0.1880]); hold on

legend('chyba redux max', 'chyba redux avg', 'složitost redux max', 'složitost redux avg')
ylim([0 25])

grid
ylabel('Chyba procent / Složitost')
xlabel('Poměr kapacita:sumární váha')
hold off
