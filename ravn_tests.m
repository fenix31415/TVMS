pkg load statistics;
clear;
clc;

function ans = ko_te(n, m, a, b, u)
  x = sort(unifrnd(a, b, n, m));
  res = 0.0;
  for i = 1:n
    F_x_i = unifcdf(x(i, :), a, b);
    res = max(res, abs(F_x_i - i / n));
    res = max(res, abs(F_x_i - (i - 1) / n));
  endfor
  ans = mean((sqrt(n) * res) > 1.36);
endfunction

function ans = sm_te(n, m, a, b)
  x = sort(unifrnd(a, b, n, m));
  sum = 1 / (12 * n);
  for i = 1:n
    F_x_i = unifcdf(x(i, :), a, b);
    sum = sum + (F_x_i - (2 * i - 1) / (2 * n)).^2;
  endfor
  ans = mean(sum > 0.4614);
endfunction

function do_test(n, m, a, b)
  printf("Kolmogorov: n = %d, alpha = %g\n\n", m, ko_te(n, m, a, b));
  printf("Smirnov: n = %d, alpha = %g\n\n" , m, sm_te(n, m, a, b));
endfunction

n = 100;
A = -3;
B = 14;

do_test(n, 10^4, A, B);
do_test(n, 10^6, A, B);