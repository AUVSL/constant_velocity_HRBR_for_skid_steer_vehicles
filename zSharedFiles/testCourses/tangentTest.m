% read in waypoints array from workspace
waypoints = evalin('base', 'waypoints');

point = 70;

vect = getTangentVector(waypoints(point+1, :), waypoints(point-1, :));

starting = waypoints(point, :);

ending = starting + vect;

plot([starting(1); ending(1)], [starting(2); ending(2)], 'LineWidth', 2)