function [simOut] = runSim(pathA)
path = pathA;
Simulation_Time=1000;
pathcount=0;% used by path error calculator
[pathlength,~]=size(pathA);% used by path error calculator
sim('SSMM_sim_Torque_3DOF',Simulation_Time)
simOut = output;
end