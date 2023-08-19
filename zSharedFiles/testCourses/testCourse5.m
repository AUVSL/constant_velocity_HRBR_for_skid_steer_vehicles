
% Generation of Test Course 3

% Input: L ----- Horizontal length of TC3
%        R ----- Turn radius
%        n ----- Number of "dips"
%        cStep - Curve stepsize
%   -2 * R - L
function testCourse5(L, R, cStep)



% compute x-coordinate of first corner-point
x1 = (L / 2) - R + R;

% initialize corner-point data with first 2 corner-points
cpData = [x1,   0,      R;
          x1, 2*R - L, R];
      
      
% initialize current corner-point coordinates
x = x1;
y = -2 * R;


% add the final corner-point to the corner-point data array
cpData = [cpData;
          L,    -L+2*R,   R];

% generate waypoints from corner-point data
generateWaypoints(cpData, cStep);
