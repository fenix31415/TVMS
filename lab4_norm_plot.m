pkg load statistics;

clc;
clear;

n = 1000000;
m = 100;
mu = 0;
sigma = 1;

x = normrnd(mu, sigma, n, 1);
[h_y, h_x] = hist(x, m);
a = min(x);
b = max(x);
h_y = h_y / n / ((b - a) / m);
[plot_x, plot_y] = stairs(h_x, h_y);
normp_x = a:0.05:b;
normp_y = normpdf(normp_x, mu, sigma);

plot(plot_x, plot_y, normp_x, normp_y);
