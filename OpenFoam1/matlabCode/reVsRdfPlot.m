clear all;
close all;

re = [10 224.2 442.2];
ndf = [16.493 20.464 24.477];

figure
hold on
plot(re, ndf, '-or');
title("Reynolds Number vs Nondimensional Shear Force")
xlabel("Reynolds Number");
ylabel("Nondimensional Shear Force");


n = [20*20 40*40 80*80 160*160];
c = [5/0.005 8/0.0025 12/0.00125 98/0.000625];
figure
hold on
loglog(n, c, '-or')
title("Wallclock Time per Mesh Count with alpha estimate fitted")
xlabel("Mesh Count")
ylabel("Wallclock Time")
logN = log(n);
logC = log(c);
coefficients = polyfit(logN, logC, 1);
alpha = coefficients(1);
alpha_data = exp(polyval(coefficients, logN));
loglog(n, alpha_data, '-ob');







