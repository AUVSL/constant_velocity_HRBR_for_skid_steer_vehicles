% ========================== Show Motion ==================================

%after running the simulation, run the line of code below to view a 3d
%render of the sim that uses showmotion

% showmotion(model,tout,[fbanim(xout);squeeze(xout(14:17,:,:))])

delay=0.075;


%===================== Visualize Frame and Ground =========================
% Draw the reference frame F_0 axes X_0, Y_0 and Z_0 using the "appearance"
% attribute to provide a visual reference in space
model.appearance.base = ...
  { 'colour', [0.9 0 0], 'line', [0 0 0; 2 0 0], ...
    'colour', [0 0.9 0], 'line', [0 0 0; 0 2 0], ...
    'colour', [0 0.3 0.9], 'line', [0 0 0; 0 0 2]};

% Draw an approximation of the ground through tiles. Also set the ground's
% friction, stifness, damping coefficients
x_aux = -1:1:10;
y_aux = -5:1:5;
A = 0.01; %can be increased to increase the height of the centrally located tiles to help distinguish between them
sigma = 2;
x0 = 6;
y0 = 0;
for x = 2:length(x_aux)
    for y = 2:length(y_aux)
        alt = A*exp(-(((x_aux(x)-x0).^2)/(2*sigma^2)+((y_aux(y)-y0).^2)/(2*sigma^2))); %z/tile height
        
        model.appearance.base = ...
        {model.appearance.base,...
        'tiles', [ x_aux(x-1) x_aux(x);y_aux(y-1) y_aux(y); alt alt], 0.1};
    end
end



% ===================== Ground Contact Parameters =========================
K=1000000; % ground stiffness/youngs modulus. used by 3D Ground Contact
D=1000; %ground damping coefficient. used by 3D Ground Contact
Mu=.85; %coefficient of friction of tires on concrete



% ==================== Jackal Geometetry Parameters =======================
% From ClearPath, https://github.com/jackal/jackal/blob/melodic-devel/jackal_description/urdf/jackal.urdf.xacro

chassis_mass = 16.523; % kg
chassis_length = .420; % m
chassis_width = 0.310; % m
chassis_height = 0.184; % m
chassis_center_of_mass = [0.012  0.002 0.067]; % m (xyz)
chassis_moments_of_inertia = [0.3136  -0.0008  0.0164;
                              -0.0008  0.3922  0.0009;
                              0.0164   0.0009  0.4485];
wheel_mass = 0.477; % kg
wheel_radius = .098; % m
wheel_width = .040; % m
wheel_center_of_mass = [0 0 0]; % m (xyz)
wheel_moments_of_inertia = [0.0013   0       0;
                              0        0.0024  0;
                              0        0       0.0013];
wheelbase = 0.262; % m
track = 0.37559; % m
wheel_vertical_offset = 0.0345; % m
wheel_offset = [wheelbase/2 track/2 wheel_vertical_offset]; 



%============================= SSMM Model =================================
% Store all model parameters in a variable called "model".
% model.NB: is the number of bodies in the model.
% Variable model.NB is initialized in zero and incremented whenever a new
% body is added to the model...  This allows to easily expand any model!
model.NB = 0;



% -----------------------------Floating Base-------------------------------
% To create a floting base, a body (with frame F1) is added and "connected"
% to the reference frame F0 by any 1-DOF joint (e.g. rotary or prismatic),
% which will be later replaced by a full 6-DOF joint using the function 
% floatbase.  The 1-DOF joint is simply a temporary placeholder for the
% 6-DOF joint

i=1; % This is the first body, and it's index is one.
model.NB=model.NB+1; % model.NB is updated with the new body.
model.jtype{i} = 'R'; % Any type of joint may be selected
model.parent(i) = 0 ; % The floating base parent is the fixed frame, i.e. \lambda(1) = 0

% The initial link-to-link transform from F_0 to F_1 is the identity, 
% because at the initial state both frames are aligned.

model.Xtree{i}  = xlt([0 0 0]);

mass(i) = chassis_mass;
basesize = [chassis_length chassis_width chassis_height];
CoM(i,:) = chassis_center_of_mass;
Icm(i:i+2,:) = chassis_moments_of_inertia;

% The mass, COM and Icm are employed to build the rigid-body's spatial 
% inertia, which is stored in the model parameter "model.I{1}".
model.I{i}      = mcI(mass(i), CoM(i,:), Icm(i:i+2,:));

% Define the floating base appearance to display/visualize the simulation results.
model.appearance.body{1} = {'colour', [250 137 45]/255, 'box',   [-basesize(1)/2 -basesize(2)/2 -basesize(3)/2; basesize(1)/2 basesize(2)/2 basesize(3)/2] };



%  -------------------------- Wheels --------------------------------------
% Wheels are the bodies 2, 3, 4 and 5.
for i = 2:5
model.NB=model.NB+1; % Update the body number for each wheel

% Wheels are modeled as rotary joints that rotate about the Y-axis of
% frames F2, F3, F4, and F5 (children of parent frame F1).
model.jtype{i} = 'Ry'; 
model.parent(i) = 1 ; % The wheels' parent body is the floating base, i.e. \lambda(i) = 1

mass(i) = wheel_mass;

% Each wheel has a different location and the link-to-link transform is
% only a translation of the wheel frame with to the body frame without rotation.
if(i==2)model.Xtree{i} = xlt([ wheel_offset(1) -wheel_offset(2)  -wheel_offset(3)]);end %top left
if(i==3)model.Xtree{i} = xlt([-wheel_offset(1) -wheel_offset(2)  -wheel_offset(3)]);end %bottom left
if(i==4)model.Xtree{i} = xlt([ wheel_offset(1)  wheel_offset(2)  -wheel_offset(3)]);end %top right
if(i==5)model.Xtree{i} = xlt([-wheel_offset(1)  wheel_offset(2)  -wheel_offset(3)]);end %bottom right

CoM(i,:) = wheel_center_of_mass; 

% The spatial rigid-body inertia is calculated for each wheel using the
% mass, COM and inertia tensor.
model.I{i} = mcI(mass(i),CoM(i,:),wheel_moments_of_inertia); 

% Define the wheels' visual representation attributes. Also, a red dot is
% added to each wheel as a visual reference, to appreciate the turn of the 
% wheels 
model.appearance.body{i} = { 'colour', [0.1 0.1 0.1],...
                             'facets', 32,...
                             'cyl', [0 -wheel_width/2 0; 0 wheel_width/2 0], wheel_radius,...
                             'colour', [0.8 0.1 0.1],...
                             'cyl', [0 -wheel_width/2-2e-3 -wheel_radius*.85; 0 wheel_width/2+2e-3 -wheel_radius*.85],.1*wheel_radius};
end



%==================== Additional Model Parameters =========================
% The default gravity is zero, so it must be defined as:
model.gravity = [0 0 -9.8];

% Once each body in the model has been defined, the first body must be 
% turned into a floating base:
model = floatbase(model);

% By doing this, the body 1 has now 6 DOFs and can be tought as if it would
% be formed by the composition of 6 bodies each having a 1-DOF joint.  So
% the first six joint variables belong to body 1, while the wheels which
% to be associated to bodies/frames 2, 3, 4, 5 are now bodies/frames 7, 8,
% 9, 10.  Similarly the model variable model.NB is now valued model.NB+5.



%======================== Contact Points (CPs) ============================
% The contact points are defined as point that cannot penetrate the ground
% plane defined as the plane z=0 in the frame F0.  Each contact point
% contains information about the body to which it belongs and its location
% in the body's reference frame.

% Floating Base CPs --------------------------------------------
CP_Base =[basesize(1)/2 -basesize(1)/2 basesize(1)/2 -basesize(1)/2 basesize(1)/2 -basesize(1)/2 basesize(1)/2 -basesize(1)/2;... X parameter of each CP
          basesize(2)/2 basesize(2)/2 -basesize(2)/2 -basesize(2)/2 basesize(2)/2 basesize(2)/2 -basesize(2)/2 -basesize(2)/2;... Y parameter of each CP
          basesize(3)/2 basesize(3)/2 basesize(3)/2 basesize(3)/2 -basesize(3)/2 -basesize(3)/2 -basesize(3)/2 -basesize(3)/2];  %Z parameter of each CP
                 
% The body number of each CP
CP_Base_Body_Labels = 6*ones(1,length(CP_Base));

% Total number of CPs for the floating base
CP_Base_Num = length(CP_Base_Body_Labels);



% ---------------------------- Wheels' CPs---------------------------------
% Because of the wheels' symetry, all CPs are located equidistant one
% from another about the perimeter of each wheel.
npt_1 = 32; % 32 CPs per wheel are been modeled

% The position for each CP on a wheel is calculated next.
ang = (0:npt_1-1) * 2*pi / npt_1;
Y = ones(1,npt_1) * wheel_width/2;
X = sin(ang) * wheel_radius;
Z = cos(ang) * wheel_radius;

CP_Wheel = [ X;...
             Y;...
             Z ];

% A contact point at the center of each wheel is added just to extract the
% position and velocity of each of the wheels.
CP_Wheel = [CP_Wheel [0;0;0]];
          
% Define the corresponding body for the wheels' CPs
CP_Wheel_1_Body_Labels =  7*ones(1,length(CP_Wheel(1,:)));
CP_Wheel_2_Body_Labels =  8*ones(1,length(CP_Wheel(1,:)));
CP_Wheel_3_Body_Labels =  9*ones(1,length(CP_Wheel(1,:)));
CP_Wheel_4_Body_Labels = 10*ones(1,length(CP_Wheel(1,:)));

% The CPs of all four wheels are store in a single variable:
CP_Wheels = [CP_Wheel CP_Wheel CP_Wheel CP_Wheel];

% All the corresponding body label for the wheels' CPs are also stored in a single variable:
CP_Wheels_Body_Labels = [CP_Wheel_1_Body_Labels CP_Wheel_2_Body_Labels...
                         CP_Wheel_3_Body_Labels CP_Wheel_4_Body_Labels];

% Total number of wheel contact points
CP_Wheels_Num = length(CP_Wheel_1_Body_Labels)*4;



% ======================== Model Format ===================================
% All the contact points and parents position previously defined
% are put on the Spatial Toolbox format as shown below
model.gc.point = [CP_Base CP_Wheels];
model.gc.body = [CP_Base_Body_Labels CP_Wheels_Body_Labels];

% The simulation in Simulink needs some auxiliar variables that define 
% the starting index of the wheels's CPs within the general CP array 
% (model.gc.point) for each wheel separately.
CP_Wheel_1_Index = length(CP_Base_Body_Labels)+1;
CP_Wheel_2_Index = length(CP_Base_Body_Labels)+length(CP_Wheels_Body_Labels)/4+1;
CP_Wheel_3_Index = length(CP_Base_Body_Labels)+length(CP_Wheels_Body_Labels)*2/4+1;
CP_Wheel_4_Index = length(CP_Base_Body_Labels)+length(CP_Wheels_Body_Labels)*3/4+1;
CP_Wheels_Final_Index = length(CP_Base_Body_Labels)+length(CP_Wheels_Body_Labels)*4/4;

% Auxiliar variables are declared to store the total number of CPs in the
% simulation considering the external forces and without including the
% external forces:
CP_Num = CP_Base_Num + CP_Wheels_Num;
CP_Num_aux = CP_Base_Num + CP_Wheels_Num; 



% ===================== Internal Contoller Parameters =====================
% In reality, Jackal has only two motors, one per side. However, it's more 
% straightforwardto simulate as if there's an actuator per wheel.
kp = 4;
ki = 500;
kd = -0.002;
wheel_veocity_saturation = 2.2; % m/s
torque_saturation = 7; % Nm
realistic_linear_velocity_factor = 0.9782; %The jackal does not actually hit its linear velocity commands so this factor is multiplied by the linear velocity command for the accuarcy of the model



% =========================== Initialization ==============================
% Finally, the initial condition is declared:
zoff=wheel_radius+basesize(3)/2-wheel_offset(3)+.01; %initialization zoffset so the model starts 5cm in the air
x_init = [1 0 0 0  0 0 zoff   0 0 0  0 0 0]';
%         |______| |_______| |_____| |____|
%             |        |        |       |->Linear Velocity in F_1
%             |        |        |          Coordinates
%             |        |        |
%             |        |        |->Angular Velocity in F_1 coordinates
%             |        |        
%             |        |->Position relative to F_0
%             |
%             |->Orientation Quaternion
%
q_init = [0 0 0 0]';
qd_init = [0 0 0 0]';