clc
% HBZ (Variable Velocity Control)
testCourse3(20, 1, 4, 0.5)
path = waypoints;
clc
hbzW = runSim(path_W);
% 
% path = path_B;
% hbz_B = runSim(path_B); 
% % 
% path = path_C;
% hbz_C = runSim(path_C); 


% [rmse_hbzW, me_hbzW, time_hbzW] = errorsNtime(hbzW, 2, 0);
% result = [rmse_hbzW, me_hbzW, time_hbzW]

% [rmse_hbzB, me_hbzB, time_hbzB] = errorsNtime(hbz_B, 2, 0);
% result = [rmse_hbzB, me_hbzB, time_hbzB]


% Fuzzy (Constant Velocity Control)
% path = path_W;
% fzyW = runSim(path_W);
% 
% path = path_B;
% fzy_B = runSim(path_B); 
% 
% path = path_C;
% fzy_C = runSim(path_C); 



% Pure Pursuit (Constant Velocity Control)
% path = path_W;
% ppW = runSim(path_W);
%  
% path = path_B;
% pp_B = runSim(path_B); 
% 
% path = path_C;
% pp_C = runSim(path_C); 