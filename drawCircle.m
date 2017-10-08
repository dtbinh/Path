function drawCircle(xcenter, ycenter, radius)

theta = 0:0.01:2*pi;
x = radius * cos(theta) + xcenter;
y = radius * sin(theta) + ycenter;
plot(x, y);
axis square;
grid on;
axis equal;
hold on;