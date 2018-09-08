% SiSy _ Lab3B _ Exercise 1
% =============================
clear all, close all, clc;

% PARAMETERS
N = 1000;           % number of points
Fs = 5000;          % sampling freq
Ts = 1/Fs;          % sampling period

aux = 0:1:N-1;      % auxiliary vector
t = Ts * aux;       % time vector
f = (Fs/N) * aux;   % freq vector

% FUNCTIONS
x1_t = ones(1,N);
x2_t = [zeros(1,N/4),ones(1,N/2),zeros(1,N/4)];
x3_t = [zeros(1,3*N/8),ones(1,N/4),zeros(1,3*N/8)];

X1_f = (1/N)*fft(x1_t);
X2_f = (1/N)*fft(x2_t);
X3_f = (1/N)*fft(x3_t);

% PLOTS
subplot(321), plot(t,x1_t), grid on;
subplot(323), plot(t,x2_t), grid on;
subplot(325), plot(t,x3_t), grid on;

subplot(322), plot(f,abs(X1_f)), grid on,xlim([0 100]);
subplot(324), plot(f,abs(X2_f)), grid on,xlim([0 100]);
subplot(326), plot(f,abs(X3_f)), grid on,xlim([0 100]);


