function plotTestCourse(I2)
waypoints = evalin('base', 'waypoints');
x = waypoints(:, 1); y = waypoints(:, 2);
x = [0; x]; y = [0; y];
plot(x, y, I2); hold on
x_min = min(x); x_max = max(x); y_min = min(y); y_max = max(y);
range = max(x_max - x_min, y_max - y_min)/2*1.1;
axis([-range, range, -range, range])

