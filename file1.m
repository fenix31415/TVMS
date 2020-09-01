pkg load statistics;
    
function res = f(x)
    res = cos(x)./(x+5);
endfunction  

function calc_integral(n)
  a = -3;
  b = 4;
  y = 0.95;
  
  T = norminv((y + 1) / 2);
  X = unifrnd(a, b, 1, n);
  F_x = f(X) * (b-a); 
  V = mean(F_x);
  
  d = (std(F_x) * T) / sqrt(n);
  printf("N = %d\n", n);
  printf("Value=%g (from %g to %g)\n", V, V - d, V + d);
  printf("Delta=%g\n\n", d);
endfunction

clc
clear
printf("Sample=%g\n\n", quad(@f, -3, 4));
calc_integral(10^4);
calc_integral(10^6);
