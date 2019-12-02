% SiSy-EN HS19 
% Trial ZOH + Anti-Image Filter in Time Domain
% ================================
clear all, close all, clc

% Consider the following signals:
% =================================
% x0_t  : original analog (continuous signal) ; not shown in this simu
% x1_t  : analog signal after anti-aliasing filter (LPF w/ fc < Fs/2)
% x2_n  : discrete signal after the ADC
% =================================
% Obs.: analog signals are represented in Matlab 
%       with an upsampling factor  N=100
% =================================
% x2_t  : upsampled discrete signal (equiv. analog) before ZOH
% x3_t  : analog signal after ZOH (staircase shape)
% x4_t  : analog signal after anti-image LPF (LPF w/ fc < Fs/2)
% =================================

% CONSTANTS & DEFINITIONS
x2_n = randi(2^4-1,[1,10]);    

N = 100;
aux = 0:1:N-1;

% OPERATIONS
x2_t = upsample(x2_n,N);

gzoh_t = ones(1,N);

x3_t = conv(x2_t,gzoh_t);

num =  [1];
den = [25 1];
sys = tf(num,den);

glpf_t = impulse(sys,aux);

x4_t = conv(x3_t,glpf_t);

% PLOTS
figure()
subplot(311),plot(x2_t),xlim([0 1200]),grid on
subplot(312),plot(x3_t),xlim([0 1200]),grid on
subplot(313),plot(x4_t),xlim([0 1200]),grid on

