Clone the files on the  AUVSL/ConstantVelHRBRforDifferentialSteerVehicles GitHub

If you want to run the simulation open the simulation folder and
1) open and run prerun.m to load in paths and dependencies
2) run JACKAL_dynamic_model.m to load in values needed for the dynamic model (the functions of which are in the spatia_v2 folder)
3) Uncomment the paths you want to run in AutoRun.m and press the run button (Note this will only run one simulink file/ controller at a time. Since the runSim function is tied to SSMM_sim_...)
4) To connect other controllers such as the pure pursuit controller, open SSMM_sim_Torque_3DOF.slx, uncomment the controller of interest, comment out the existing controller, and swap the connects

If you want to run the code on an external ROS platform open the experiment folder and
1) open and run prerun.m to load in paths and dependencies
2) open the simulink block diagram for the controller of interest
3) make sure the platform and computer with matlab are on the same network
4) add the ip address of the robot you are trying to connect in simulink and locally in the network config file

Plot functions and course creaters are found under the helperFunctions folder

Lastly, there is the 'Fuzzy Logic Controller' block. Unlike the other two controller this block does not have a .m script. Instead, the controller is access by going to the 'Command Window' and typing in "fuzzyLogicDesigner('fuzzyControl.fis')". From here, I recommend clicking around the 'Edit' and 'View' tabs. (Documentation if curious https://www.mathworks.com/help/fuzzy/building-systems-with-fuzzy-logic-toolbox-software.html#FP39727)

known issue(s)
1) the angular velocity setpoints data for the controllers in the experimental folder will sometimes be saved with an offset from what actually was seen in experiment/ what the vehicles send out with ros

This code is associated with the paper:
Dekhterman, S.R., Cichon, M.T., Norris, W.R., Nottage, D. & Soylemezoglu, A. (2024) Hierarchical rule-base reduction fuzzy control for constant velocity path tracking of a differential steer vehicle. Journal of Field Robotics, 1–17. https://doi.org/10.1002/rob.22287
