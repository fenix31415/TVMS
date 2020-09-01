pkg load statistics;

xmin = -0.5;
xmax = 1.5;
n = 50;
c = [1.3, 2.8];
s = 2.3;

X = xmin : (xmax - xmin) / (n - 1) : xmax;
origin_y = polyval(c, X);
noised_y = origin_y + s * randn(1, n);
polinom = polyfit(X, noised_y, 1);
printf("Diff: %f\n", polinom(1) - b);

Yp2 = polyval(polinom, X);
avg_x = mean(X);
avg_noised_y = mean(noised_y);
cov = (X - avg_x) * (noised_y - avg_noised_y)' / (n - 1);
b = cov / (std(X)^2);
Yp1 = avg_noised_y + b * (X - avg_x);

diff = Yp1 - noised_y;
printf("Ort check: %f\n", Yp1 * diff');
sn = sqrt(diff / (n - 2) * diff');
printf("Noise: %f\n", sn);

t = 1.96;
h = t * (sn / sqrt(n));
d = h * (1 + (X - avg_x).^2 / (std(X)^2)).^(1 / 2);
left = Yp1 - d;
right = Yp1 + d;

plot(X, noised_y, '+', X, origin_y, X, Yp1, 'o', X, Yp2, '*', X, left, X, right);
