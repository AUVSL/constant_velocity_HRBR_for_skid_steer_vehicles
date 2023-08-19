addpath(genpath('/home/auvsl/sam/HRBRforDifferentialSteerVehicles/zSharedFiles'))

%% Test Course in the shape of a B  [CODE NAME: B]
close all; clc
wypts = [[0.0, 0.0];              [1.0000, 0];        [1.7000, -0.1876];
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
spd = 2; %speed in m/s that the test was run at

pp_vs_CVF_vs_hbz_coursePlots(ppB, fzyB, hbzB, wypts, spd)

[rmse_ppB, me_ppB, time_ppB] = errorsNtime(ppB, spd, 1);
[rmse_fzyB, me_fzyB, time_fzyB] = errorsNtime(fzyB, spd, 1);
[rmse_velB, me_velB, time_velB] = errorsNtime(hbzB, spd, 0);

pp_b = [rmse_ppB, me_ppB, time_ppB]
fzy_b = [rmse_fzyB, me_fzyB, time_fzyB]
hbz_b = [rmse_velB, me_velB, time_velB]

%% Test Course in the shape of a C  [CODE NAME: C]
close all;
wypts =     [[0, 0];        [14.7800, 0];  [15.6427, -0.3573]; 
     [16.0000, -1.2200];  [16.0000, -4.7800];  [15.6427, -5.6427]; 
     [14.7800, -6.0000];   [1.2200, -6.0000];   [0.3573, -6.3573]; 
      [0.0000, -7.2200];  [0.0000, -10.7800];  [0.3573, -11.6427]; 
     [1.2200, -12.0000]; [14.7800, -12.0000]; [15.6427, -12.3573]; 
    [16.0000, -13.2200]; [16.0000, -16.7800]; [15.6427, -17.6427]; 
    [14.7800, -18.0000]; [-3.7800, -18.0000]; [-4.6427, -17.6427]; 
    [-5.0000, -16.7800];  [-5.0000, -1.2200];  [-4.6427, -0.3573]; 
           [-3.7800, 0];              [0, 0]];
spd = 2; %speed in m/s that the test was run at

pp_vs_CVF_vs_hbz_coursePlots(ppC, fzyC, hbzC, wypts, spd)

[rmse_ppC, me_ppC, time_ppC] = errorsNtime(ppC, spd, 1);
[rmse_fzyC, me_fzyC, time_fzyC] = errorsNtime(fzyC, spd, 1);
[rmse_hbzC, me_hbzC, time_hbzC] = errorsNtime(hbzC, spd, 0);
 
pp_c = [rmse_ppC, me_ppC, time_ppC]
fzy_c = [rmse_fzyC, me_fzyC, time_fzyC]
hbz_c = [rmse_hbzC, me_hbzC, time_hbzC]


%% Test Course in the shape of a B  [CODE NAME: B]
close all; clc
wypts = [[0.0, 0.0];              [1.0000, 0];        [1.7000, -0.1876];
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
spd = 2; %speed in m/s that the test was run at

pp_vs_CVF_vs_hbz_coursePlots(ppT3, fzyT3, hbzB_grav2, wypts, spd)

[rmse_ppB, me_ppB, time_ppB] = errorsNtime(ppT3, spd, 1);
[rmse_fzyB, me_fzyB, time_fzyB] = errorsNtime(fzyT3, spd, 1);
[rmse_velB, me_velB, time_velB] = errorsNtime(hbzB_grav2, spd, 0);

pp_b = [rmse_ppB, me_ppB, time_ppB]
fzy_b = [rmse_fzyB, me_fzyB, time_fzyB]
hbz_b = [rmse_velB, me_velB, time_velB]

%% Test Course in the shape of a C  [CODE NAME: C]
close all;
wypts =     [[0, 0];        [14.7800, 0];  [15.6427, -0.3573]; 
     [16.0000, -1.2200];  [16.0000, -4.7800];  [15.6427, -5.6427]; 
     [14.7800, -6.0000];   [1.2200, -6.0000];   [0.3573, -6.3573]; 
      [0.0000, -7.2200];  [0.0000, -10.7800];  [0.3573, -11.6427]; 
     [1.2200, -12.0000]; [14.7800, -12.0000]; [15.6427, -12.3573]; 
    [16.0000, -13.2200]; [16.0000, -16.7800]; [15.6427, -17.6427]; 
    [14.7800, -18.0000]; [-3.7800, -18.0000]; [-4.6427, -17.6427]; 
    [-5.0000, -16.7800];  [-5.0000, -1.2200];  [-4.6427, -0.3573]; 
           [-3.7800, 0];              [0, 0]];
spd = 2; %speed in m/s that the test was run at

pp_vs_CVF_vs_hbz_coursePlots(ppT2, fzyT2, hbzC_grav, wypts, spd)

[rmse_ppC, me_ppC, time_ppC] = errorsNtime(ppT2, spd, 1);
[rmse_fzyC, me_fzyC, time_fzyC] = errorsNtime(fzyT2, spd, 1);
[rmse_hbzC, me_hbzC, time_hbzC] = errorsNtime(hbzC_grav, spd, 0);
 
pp_c = [rmse_ppC, me_ppC, time_ppC]
fzy_c = [rmse_fzyC, me_fzyC, time_fzyC]
hbz_c = [rmse_hbzC, me_hbzC, time_hbzC]