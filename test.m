pkg load statistics;

function calc_volume(n)
  c = 40.4;
  y = 0.95;
  k = 10;
  T = norminv((y + 1) / 2);
  X = rand(k, n);
  F_x = sum(power(7, X));
  V = mean(F_x <= c);
  interval = T * sqrt(V * (1 - V) / n);
  printf("N=%d\n",n);
  printf("S=%g (from %d to %g)\n",V, V - interval, V + interval);
  printf("Delta=%g\n\n", interval); 
endfunction

clc
clear
calc_volume(10^4);
calc_volume(10^6);
