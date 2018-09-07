% Example: LTI System Definition in Matlab
% =====================================
clear all, close all, clc;


% Reference System 2nd Order

% Parameters
w0 = 2*pi*1e3;
d = 0.05;
k = 3;

% System Definition
num = [k*w0^2];
den = [1 2*d*w0 w0^2];

sys = tf(num,den)

figure(1)
bode(sys),grid on


figure(2)
subplot(211),step(sys),grid on
subplot(212),impulse(sys),grid on


