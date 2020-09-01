m = 100;
left = 0;
right = 10;
p = 1 / (right - left);

x = unifrnd(left, right, n, 1);
[h_y, h_x] = hist(x, m);
a = min(x);
b = max(x);
h_y = h_y / n / ((b - a) / m);
[plot_x, plot_y] = stairs(h_x, h_y);
unifp_x = [a, a, b, b];
unifp_y = [0, p, p, 0];

plot(plot_x, plot_y, unifp_x, unifp_y);
