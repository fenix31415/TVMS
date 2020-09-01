pkg load statistics;

clc;
clear;

n = 10000;
m = 22;
k = 1000;
mu = 0;
sigma = 1;


chi2 = zeros(1, k);

i = 1;
while (i <= k)
    x = normrnd(mu, sigma, n, 1);
    [h_y, h_x] = hist(x, m);
    a = min(x);
    b = max(x);
    len = (b - a) / m;
    j = 1;
    while (j <= m)
        p = normcdf(a + j * len, mu, sigma) - normcdf(a + (j - 1) * len, mu, sigma);
        chi2(i) = chi2(i) + ((h_y(j) - n * p) ^ 2) / n / p;
        j++;
    endwhile    
    i++;        
endwhile

err1 = mean(chi2 > chi2inv(0.95, m - 1));

function retval = do_tests(mu, sigma, n, m, k, shift)
    chi2 = zeros(1, k);
    segments = zeros(1, k);
    
    i = 1;
    while (i <= k)
        x = normrnd(mu, sigma, n, 1);
        [h_y, h_x] = hist(x, m);
        a = min(x);
        b = max(x);
        len = (b - a) / m;
        j = 0;
        while (j < m)
            cnt = 0;
            p = -normcdf(a + j * len, mu + shift, sigma);
            while (cnt < 6 && j < m)
                j++;
                cnt += h_y(j);
            end
            p += normcdf(a + j * len, mu + shift, sigma);
            chi2(i) = chi2(i) + ((cnt - n * p) ^ 2) / n / p;
            segments(i) = segments(i) + 1;
        endwhile    
        i++;        
    endwhile
    
    retval = mean(chi2 > chi2inv(0.95, segments - 1));
endfunction

err2 = do_tests(mu, sigma, n, m, k, 0);
err3 = 1 - do_tests(mu, sigma, n, m, k, 0.5);

printf("Type I error alpha: %f \n", err1);
printf("Type I error alpha (corrected): %f\n", err2);
printf("Type II error beta with delta=0.005: %f\n", 1 - do_tests(mu, sigma, n, m, k, 0.005));
printf("Type II error beta with delta=0.5: %f\n", err3);
