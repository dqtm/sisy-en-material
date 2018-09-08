% =========================================================
% SiSy Lab 1B : Mobile IMU Sensors - Step1
% Acquire IMU sensor data from mobile via App, plot and 1st processing step
% =========================================================
% Obs:   Follow setup instructions in lab description, before running this script
% Version: initial -                    dqtm 13.Sep.2016
%          separated, step-by-step -    dqtm 25.Sep.2017
% =========================================================
clear all, close all, clc;

% connector on yourpassword;  % need only for 1st run!

m = mobiledev

m.AccelerationSensorEnabled    = 1;
m.AngularVelocitySensorEnabled = 1;
m.MagneticSensorEnabled        = 0;
m.OrientationSensorEnabled     = 1;
m.PositionSensorEnabled        = 0;

%% Start acquiring data

m.Logging = 1;      
pause(10);
m.Logging = 0;      % Logs data during 8 seconds
% if not stopping with command from PC, stop sending in the Phone

%% Sort out and plot acquired data

% VARIABLES WITH RAW SENSOR DATA
[ac, tac] = accellog(m);    % ACCELEROMETERS
[av, tav] = angvellog(m);   % GYROMETERS
[o,  to]  = orientlog(m);   % ORIENTATION

% PLOTS
% Generate a plot of each sensor type (accelerometer / gyro / orientation)
% And find out which column corresponds to each axis (add legend in the plot)

% Compensate the offset in the gyrometer time vector, 
% such that you can compare all sensor data in the same time interval

% Scale angular velocity in degrees/second

