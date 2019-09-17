% =========================================================
% SiSy Lab 1B : Mobile IMU Sensors - Exercise 3
% Acquire IMU sensor data from mobile via App, plot and 1st processing step
% =========================================================
clear all, close all, clc;

% Exercise-3 : Sort out and plot acquired data


%% Example for CSV Logfile
% ========================
% Importing CSV logfile
DataCSV = csvread('sensorlog_accel_csv_format.csv',1,0); % import csv skipping 1st row
% quick check on data before starting processing
figure(),plot(DataCSV(:,1), DataCSV(:,2:4)),grid on

% Splitting imported data into vectors
accel_t = DataCSV(:,1);
accel_x = DataCSV(:,2);
accel_y = DataCSV(:,3);
accel_z = DataCSV(:,4);

% Set start of time vector=0, and scale to sec (originally ms)
accel_t = 1e-3*(accel_t - accel_t(1));

% Plot acquired data from x-/y-/z-accelerometer 
figure()
plot(accel_t,[accel_x accel_y accel_z]),grid on
legend({'x','y','z'})
xlabel('t (s)'),ylabel('accel (m/s)')

%% Example for MAT Logfile
% ========================
% Importing MAT logfile
load('sensorlog_accel_mat_format.mat')

accel = (timetable2table(Acceleration));    % convert into regular table
summary(accel)                              % summarise table infos
[Y,M,D,H,MN,S]=datevec(accel{:,'Timestamp'}); % extract date values into vectors

% Obs.: Use {} to access contents inside table!!!

% quick check on data before starting processing
figure(),plot(S, accel{:,{'X','Y','Z'}}),grid on

% Splitting imported data into vectors
accel_t = S-S(1);       % remove offset and start time vector at 0s
accel_x = accel{:,'X'};
accel_y = accel{:,'Y'};
accel_z = accel{:,'Z'};


% Plot acquired data from x-/y-/z-accelerometer 
figure()
plot(accel_t,[accel_x accel_y accel_z]),grid on
legend({'x','y','z'})
xlabel('t (s)'),ylabel('accel (m/s)')



%% PLOTS : HINTS (you might need when importing data from your mobile!)
% Generate a plot of each sensor type (accelerometer / gyro / orientation)
% And find out which column corresponds to each axis (add legend in the plot)

% Compensate eventual offsets in the time vectors, 
% such that you can compare all sensor data in the same time interval

% Scale angular velocity in degrees/second

