pkg load statistics;

xmin = -0.5;
xmax = 1.5;
n = 50;
a = [1.2, -2.2, 3.5];
s = 2.3;

X = xmin : (xmax - xmin) / (n - 1) : xmax;
origin_y = polyval(a, X);
noised_y = origin_y + s * randn(1, n);
polynom = polyfit(X, noised_y, 2);
computed_y = polyval(polynom, X);

plot(X, noised_y, '+', X, origin_y, X, computed_y, 'o');

diff = computed_y - noised_y;
printf("Noise: %f\n", sqrt(diff / (n - 3) * diff'));
printf("Ort check: %f\n", computed_y * diff');
