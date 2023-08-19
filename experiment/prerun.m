clear all; clc
%this file sets the test course test courses, speed, max angular velocity,
%and lookahead distance (lookahead only for pure pursuit)

%make sure to reset the position values to (0,0) between every runs by using the 'reZero'
%Simulink file 

addpath(genpath('/home/dev/HRBRforDifferentialSteerVehicles/experiment/data'));
addpath(genpath('/home/dev/HRBRforDifferentialSteerVehicles/zSharedFiles'));

% addpath(genpath('/home/auvsl/sam/HRBRforDifferentialSteerVehicles/experiment/data'));
% addpath(genpath('/home/auvsl/sam/HRBRforDifferentialSteerVehicles/zSharedFiles'));

%% Experimental Procedure
% 1.
%     prerun - movement parameters

% 2. (Loop for each course)
%     prerun - path
%         a. (Loop for each controller)
%           reZero
%           change controller
%           rename output
%           save <filename>

% 3.
%     course Analaysis

%% movement parameters
speed = 2; %robot linear speed target in m/s (max=8.94 m/s or 20 mph)
angVeloSat = 4; %maximum allowable angular velocity of the robot
lookahead = 0.5; %lookahead distance of pure pursuit controller

%% Test Course in the shape of a repeating W [CODE NAME: W]
testCourse3(20, 1, 4, 0.5)
path = waypoints;
clc

%% Test Course in the shape of a B  [CODE NAME: B]
path =      [[0.0, 0.0];              [1.0000, 0];        [1.7000, -0.1876];
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
          
%% Test Course in the shape of a C  [CODE NAME: C]
path =         [[0, 0];        [14.7800, 0];  [15.6427, -0.3573]; 
    [16.0000, -1.2200];  [16.0000, -4.7800];  [15.6427, -5.6427]; 
    [14.7800, -6.0000];   [1.2200, -6.0000];   [0.3573, -6.3573]; 
     [0.0000, -7.2200];  [0.0000, -10.7800];  [0.3573, -11.6427]; 
    [1.2200, -12.0000]; [14.7800, -12.0000]; [15.6427, -12.3573]; 
   [16.0000, -13.2200]; [16.0000, -16.7800]; [15.6427, -17.6427]; 
   [14.7800, -18.0000]; [-3.7800, -18.0000]; [-4.6427, -17.6427]; 
   [-5.0000, -16.7800];  [-5.0000, -1.2200];  [-4.6427, -0.3573]; 
          [-3.7800, 0];              [0, 0]];
      
%% L shapped Test Course [CODE NAME: L]
path = [[0, 0]; [4, 0]; [4, 4]];           
% path  = path .* -1;

%% Test Course with a single right and left hand turn  [CODE NAME: TURNS]
path = [   [0, 0];  [1.5, 0]; [1.8536, -0.1464]; 
        [2, -0.5]; [2, -2.5]; [2.1464, -2.8536]; 
        [2.5, -3];   [4, -3]];
    
%% Test Course in the shape of a figure 8 [CODE NAME: F8]
rad = 1.5;
testCourse6(rad, 1, rad/1.5);
path = waypoints;
clc

%%
close all;
wypt =      [[0.0, 0.0];              [1.0000, 0];        [1.7000, -0.1876];
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
spd = 2;  %speed in m/s that the test was run at
% 0.3185 1.1842 15.5447
% pp_vs_CVF_vs_hbz_coursePlots(ppW, fzyL, hbzW, wypts, spd)
% 
% [rmse_ppW, me_ppW, time_ppW] = errorsNtime(ppW, spd, 1);
[rmse_fzyW, me_fzyW, time_fzyW] = errorsNtime(ppF8, spd, 1);
% [rmse_hbzW, me_hbzW, time_hbzW] = errorsNtime(hbzW, spd, 0);
% 
% pp_w = [rmse_ppW, me_ppW, time_ppW]
fzy_w = [rmse_fzyW, me_fzyW, time_fzyW]
% hbz_w = [rmse_hbzW, me_hbzW, time_hbzW]