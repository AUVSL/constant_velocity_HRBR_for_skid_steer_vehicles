%this is the model file for a kinematic differential steer model of the
%Jackal UGV. The first section must be re-run (because pathcount must be reset) every
%time you run a simulation in simulink. The second section displays a graph
%of the robot path traveled overlayed on the ideal path

close all; clear all; clc;

% ========================== Path Generator ==========================
%Below is the path that we are trying to have the model follow in the
%simulation. It is comprised of a list of target positions of the form 
%[x1 y1;x2 y2; ...;xn yn]

% path=[3 0;
%       0 1;
%       5 3;
%       5 -2;
%       5 2];

testCourse2(15, 5, 6, 6, 6, 2/pi, 1, .2)
%testCourse3(12, 1/PI, 3, 0.2);

pathcount=0;% used by path error calculator
[pathlength,~]=size(path);% used by path error calculator

speed=2; %maximum wheel speed in m/s
width=.323; %width between the left and right wheels

%delay=0.075;%Sam copied from Max's JACKEL_dynamic_model code
delay=0.15;