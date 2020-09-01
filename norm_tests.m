pkg load statistics;
clear;
clc;

function ans = kolmogorov_test(n, m, a, s)
  x = sort(normrnd(a, s, n, m));
  res = 0.0;
  for i = 1:n
    F_x_i = normcdf(x(i, :), a, s );
    res = max(res, abs(F_x_i - i / n));
    res = max(res, abs(F_x_i - (i - 1) / n));
  endfor
  ans = mean((sqrt(n) * res) > 1.36);
endfunction

function ans = smirnov_test(n, m, a, s)
  x = sort(normrnd(a, s, n, m));
  sum = 1 / (12 * n);
  for i = 1:n
    F_x_i = normcdf(x(i, :) , a, s);
    sum = sum + (F_x_i - (2 * i - 1) / (2 * n)).^2;
  endfor
  ans = mean(sum > 0.4614);
endfunction

function do_test(n, m, a, s)
  printf("Kolmogorov: n = %d, alpha = %g\n\n", m, kolmogorov_test(n, m, a, s));
  printf("Smirnov: n = %d, alpha = %g\n\n" , m, smirnov_test(n, m, a, s));
endfunction

n = 100;
A = 3;
SIGMA = 14;
w = 0.4614;

do_test(n, 10^4, A, SIGMA);
do_test(n, 10^6, A, SIGMA);
