pkg load statistics;
clear;
clc;

N = 100;
A = 3;
SIGMA = 14;

V = sort(normrnd(A, SIGMA, N, 1));
F_n = 1 / N : 1 / N : 1;
[L, R] = stairs(V, F_n);
t = (A - 3 * SIGMA) : 0.5 : (A + 3 * SIGMA);
F = normcdf(t, A, SIGMA);
delta = 1.36 / sqrt(N);
plot(L, R, t, F, L, max(0, R - delta), L, min(1, R + delta));
