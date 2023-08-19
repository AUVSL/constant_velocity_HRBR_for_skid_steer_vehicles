% cubic bezier curves



% Parameters:
% controlpoints (2x4 matrix)
%   Four points (p0,p1,p2,p3) where:
%       p0 - starting point
%       p1 - first control point
%       p2 - second control point
%       p3 - ending point
%
% step_size
%   how continuous the path will be, smaller step size = smoother curve

% control points should be in this format:
% controlpoints = [[0;0], [2;8], [2;0], [4;7]];

function generateCubicBezierWaypoints(controlpoints, step_size)

t = 0:step_size:1; % parameter t between 0 and 1

waypoints = [];

% i is parameterized variable
for i = t
    % basis functions
    b0 = (1-i).^3;
    b1 = 3*i*(1-i).^2;
    b2 = 3*(1-i)*i.^2;
    b3 = i.^3;

    basis = [b0;b1;b2;b3];

    coordinates = controlpoints * basis;
    waypoints = [waypoints; [coordinates(1),coordinates(2)]];
end

x = [waypoints(:,1)];
y = [waypoints(:,2)];
% plot path
plot(x, y); hold on

% write waypoints to workspace
assignin('base', 'waypoints', waypoints);

end