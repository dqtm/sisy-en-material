% Example: System Characteristic Equation
% Passive RLC: topo nr. 6  : BPF
% ===================================
clear all, close all, clc

% Parameters
R = 56e3;
L = 10e-3;
C = 1e-9;
w0 = sqrt(1/(L*C));
T0 = 2*pi/w0;
tstep = T0/20;

t = 0:tstep:30*T0;


%  Checking numerical solution of Diff Equation
syms s
eqn_s = (L*C*s^2) + (L/R*s) + (1) == 0
sols = solve(eqn_s,s) 

% visualize the result
A = 5;  % initial conditions, 5V stored in capacitor
y_t = A/2*( exp(sols(1)*t) + exp(sols(2)*t) );

figure(1)
plot(t,y_t);