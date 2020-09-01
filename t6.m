pkg load statistics;

clc;
clear;

n = 10000;
m = 22;
k = 1000;
left = 0;
right = 10;

function retval = do_tests(left, right, n, m, k, shift)
    p = 1 / (right - left + shift);
    chi2 = zeros(1, k);
    
    i = 1;
    while (i <= k)
        x = unifrnd(left, right, n, 1);
        [h_y, h_x] = hist(x, m);
        a = min(x);
        b = max(x);
        len = (b - a) / m;
        j = 1;
        while (j <= m)
            pj = len * p;
            chi2(i) = chi2(i) + ((h_y(j) - n * pj) ^ 2) / n / pj;
            j++;
        endwhile    
    i++;        
    endwhile
    
    retval = mean(chi2 > chi2inv(0.95, m - 1));
endfunction



err1 = do_tests(left, right, n, m, k, 0);
err2 = 1 - do_tests(left, right, n, m, k, 0.01);
err3 = 1 - do_tests(left, right, n, m, k, 1); #a tyt mi shitaem bety. shakalim pri pomoshi shifta. i smotrim, skiolko on za istiny poschital. tam voobshe 0

printf("Type I error alpha = %f\n", err1);
printf("Type II error alpha with delta=0.005: %f\n", err2);
printf("Type II error alpha with delta=0.5: %f\n", err3);
