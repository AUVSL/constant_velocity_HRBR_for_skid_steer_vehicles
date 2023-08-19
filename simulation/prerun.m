clear all; close all; clc; % Clear the workspace and erase the command window.

% Run prerun.m to set file directories, parameters, and paths
% Run JACKAL_dyn    amic_model.m to initalize simulation parameters
% Run sim with AutoRun.m (you can run a multiple paths in sequence)

% addpath(genpath('D:\Professional\AUVSL\HRBRforDifferentialSteerVehicles\simulation\data'));
% addpath(genpath('D:\Professional\AUVSL\HRBRforDifferentialSteerVehicles\simulation\spatial_v2'));
% addpath(genpath('D:\Professional\AUVSL\HRBRforDifferentialSteerVehicles\zSharedFiles'));

addpath(genpath('/home/auvsl/sam/HRBRforDifferentialSteerVehicles/simulation/data'));
addpath(genpath('/home/auvsl/sam/HRBRforDifferentialSteerVehicles/simulation/spatial_v2'));
addpath(genpath('/home/auvsl/sam/HRBRforDifferentialSteerVehicles/zSharedFiles'));

% movement parameters
speed = 2; %robot linear speed target in m/s (max=8.94 m/s or 20 mph)
angVeloSat = 4; %maximum allowable angular velocity of the robot
lookahead = 0.5; %lookahead distance of pure pursuit controller

% Test Course in the shape of a repeating W [CODE NAME: W]
testCourse3(20, 1, 4, 0.5)
path_W = waypoints;
clc

% Test Course in the shape of a B  [CODE NAME: B]
path_B =      [[0.0, 0.0];              [1.0000, 0];        [1.7000, -0.1876];
      [2.2124, -0.7000];        [2.4000, -1.4000];        [2.5876, -2.1000];
      [3.1000, -2.6124];        [3.8000, -2.8000];        [4.5000, -2.6124];
      [5.0124, -2.1000];        [5.2000, -1.4000];        [5.3876, -0.7000];
      [5.9000, -0.1876];              [6.6000, 0];        [7.3000, -0.1876];
      [7.8124, -0.7000];        [8.0000, -1.4000];        [8.1876, -2.1000];
      [8.7000, -2.6124];        [9.4000, -2.8000];       [10.1000, -2.6124];
     [10.6124, -2.1000];       [10.8000, -1.4000];       [10.9876, -0.7000];
     [11.5000, -0.1876];             [12.2000, 0];       [12.9000, -0.1876];
     [13.4124, -0.7000];       [13.6000, -1.4000];       [13.7876, -2.1000];
     [14.3000, -2.6124];       [15.0000, -2.8000];       [16.0000, -2.8000]; 
     [16.7800, 0 - 2.8]; [17.6427, -0.3573 - 2.8]; [18.0000, -1.2200 - 2.8]; 
       [18.0000, -4.78];       [17.6427, -5.6427];         [16.7800, -6.00]; 
   [-3.78 + 0.5, -6.00]; [-4.6427 + 0.5, -5.6427];      [-5.0 + 0.5, -4.78]; 
   [-5.00 + 0.5, -1.22]; [-4.6427 + 0.5, -0.3573];         [-3.78 + 0.5, 0]; 
              [-0.5, 0]];
          
% Test Course in the shape of a C  [CODE NAME: C]
path_C =         [[0, 0];        [14.7800, 0];  [15.6427, -0.3573]; 
    [16.0000, -1.2200];  [16.0000, -4.7800];  [15.6427, -5.6427]; 
    [14.7800, -6.0000];   [1.2200, -6.0000];   [0.3573, -6.3573]; 
     [0.0000, -7.2200];  [0.0000, -10.7800];  [0.3573, -11.6427]; 
    [1.2200, -12.0000]; [14.7800, -12.0000]; [15.6427, -12.3573]; 
   [16.0000, -13.2200]; [16.0000, -16.7800]; [15.6427, -17.6427]; 
   [14.7800, -18.0000]; [-3.7800, -18.0000]; [-4.6427, -17.6427]; 
   [-5.0000, -16.7800];  [-5.0000, -1.2200];  [-4.6427, -0.3573]; 
          [-3.7800, 0];              [0, 0]];

      
% % Bezier shapped Test Course [CODE NAME: BEZ]
% generateCubicBezierWaypoints([[0;0], [2;8], [2;0], [4;7]], 1/20);
% path_BEZ = waypoints;
% close all

% % L shapped Test Course [CODE NAME: L]
% path_L = [[0, 0]; [4, 0]; [4, 4]];
% 
% % Test Course with a single right and left hand turn  [CODE NAME: TURNS]
% path_TURN = [   [0, 0];  [1.5, 0]; [1.8536, -0.1464]; 
%         [2, -0.5]; [2, -2.5]; [2.1464, -2.8536]; 
%         [2.5, -3];   [4, -3]];
%     
% % Test Course in the shape of a figure 8 [CODE NAME: F8]
% rad = 1.5;
% testCourse6(rad, 1, rad/1.5);
% path_F8 = waypoints;
% clc