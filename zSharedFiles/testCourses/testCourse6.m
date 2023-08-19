% Generation of Test Course 6

% Input: R ---- Turn radius 1
%        n ----- Number of laps
%        cStep - Curve stepsize

function testCourse6(R, n, cStep)

% corner-point data describing a full lap around TC4
cpLap = [ R,      0,       R;
          R,   -2*R,      R;
         -R,   -2*R,      R;
         -R,      0,      R;
          R,      0,      R;
          R,    2*R,      R;
         -R,    2*R,      R;
         -R,      0,      R
          0,      0,      R];
     
% initialize corner-point data array
cpData = [];
% for n number of laps
for i = 1:n
    % append lap to corner-point data array
    cpData = [cpData; cpLap]
end

% generate waypoints from corner-point data
generateWaypoints(cpData, cStep)
