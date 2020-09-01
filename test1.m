pkg load statistics;

function [res] = g(x)
  res = (x .+ 1) ./ (x .+ 2);
endfunction
    
function [res] = f(x)
    res = g(x) .* exp(-3 .* x);
endfunction  

function calc_integral(n)
  lambda = 3;
  y = 0.95;
  
  T = norminv((y + 1) / 2);
  X = exprnd(1 / lambda, 1, n);
  F_x = g(X) .* 1/3;
  V = mean(F_x);
  d = (std(F_x) * T) / sqrt(n);
  printf("N = %d\n", n);
  printf("Value=%g (from %g to %g)\n", V, V - d, V + d);
  printf("Delta=%g\n\n", d);
endfunction

clc
clear
printf("Sample=%g\n\n", quad(@f, 0, inf));
calc_integral(10^4);
calc_integral(10^6);
