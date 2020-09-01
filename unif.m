pkg load statistics;
clear;
clc;

N = 100;
A = -3;
B = 14;

V = sort(unifrnd(A, B, N, 1));
F_n = 1 / N : 1 / N : 1;
[L, R] = stairs(V, F_n);
t = A : 1 / N : B;
F = unifcdf(t, A, B);
delta = 1.36 / sqrt(N);
plot(L, R, t, F, L, max(0, R - delta), L, min(1, R + delta));
