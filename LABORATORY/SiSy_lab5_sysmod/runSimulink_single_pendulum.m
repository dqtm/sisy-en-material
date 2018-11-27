% SiSy Lab5 single pendulum  _ HS18 dqtm
%  (C) RUN SIMULINK SIMULATION
% ===============================
clc, clear all, close all;

% Parameters for Model
cd = 0.05; 	% Dampfer constant in [N.m/rad.s]
m = 1.5;        % Mass in [kg]
l = 0.7;        % Length Pendel Rod in [m]
g = 9.8;        % Gravitation (acceleration) in [m/s^2]

thetaA_0 = pi/8;    % initial condition

tfinal = 60;   % Simulation time in [s]

% Open & Run Simulink model
open_system('single_pendulum')

% Parameters for Simulink
set_param(0,'solver','ode23',...
            'solvermode','auto',...
            'starttime','0.0',...
            'stoptime','tfinal')

sim('single_pendulum')

%%  (E) Checking numerical solution of Diff Equation

syms s
eqn_s = (m*l^2*s^2) + (cd*s) + (m*g*l) == 0
sol_s = solve(eqn_s,s)

% visualize the result from Matlab
t = 0:1e-1:60;
A = thetaA_0;
theta_t = A/2*( exp(sol_s(1)*t) + exp(sol_s(2)*t) );

figure(1)
plot(t,theta_t);


%% (F) Compare Simulink and Diff-Equation numerical solution

tsimu = Theta_single_simulink.time;
thetaAsimu = Theta_single_simulink.signals.values;

figure(2)
plot(tsimu,thetaAsimu,'k',...
     t,theta_t,'m'),grid
    legend({'Simulink','DiffEqu'})


