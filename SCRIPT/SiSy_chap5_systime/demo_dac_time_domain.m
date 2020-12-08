% SiSy-EN HS20
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

N = 100;        % oversampling ratio between discrete and "analog"
aux = 0:1:N-1;      % For simplicity taking normalised Ts=1

% OPERATIONS
x2_t = upsample(x2_n,N);

gzoh_t = ones(1,N);             % Impulse response ZOH
x3_t = conv(x2_t,gzoh_t);    % Output ZOH via convolution w/ impulse response

num =  [1];
den = [N/4 1];
sys = tf(num,den);                  % LTI-Sys LPF 1st order

glpf_t = impulse(sys,aux);      % Impulse response LPF 1st order
x4_t = conv(x3_t,glpf_t);        % Output LPF via convolution w/ impulse response

% PLOTS
f1=figure('Name','DAC-Steps','Position',[1 200 500 500])
subplot(311),plot(x2_t,'b'),xlim([0 12*N]),grid on, ylabel('before ZOH')
subplot(312),plot(x3_t,'r'),xlim([0 12*N]),grid on, ylabel('after ZOH')
subplot(313),plot(x4_t,'k'),xlim([0 12*N]),grid on,xlabel('index time steps'), hold on,ylabel('after LPF')

f2=figure('Name','Impulse Responses','Position',[500 200 200 300])
subplot(211),plot(aux,gzoh_t,'r'),xlim([-3*N 3*N]),grid on
subplot(212),plot(aux,glpf_t,'k'),xlim([-3*N 3*N]),grid on,xlabel('index time steps'),hold on

aux_fine = 0:1:(10*N)-1;  % index vector for plots after DAC (approx continuous w/ fine steps) 
f3=figure('Name','DAC-Steps-All-Together','Position',[700 200 500 300])
plot(aux_fine,x2_t,'b',aux_fine,x3_t(1:10*N),'r',aux_fine,x4_t(1:10*N),'k'),xlim([0 12*N]),grid on, hold on
pause(3)

%%  Trying a sharp LPF (towards ideal LPF)
%  ==================================

aux_sym = -3*N:1:3*N;
g_sharp_lpf_t = (1/N)*sinc((aux_sym)/N);

x4_sharp_t = conv(x3_t,g_sharp_lpf_t);

figure(f1)
subplot(313),plot(aux_fine,x4_sharp_t(1:10*N),'g')

figure(f2)
subplot(212),plot(aux_sym,g_sharp_lpf_t,'g')

figure(f3)
plot(aux_fine,x4_sharp_t(1:10*N),'g')
pause(3)

%%   Shift response of ideal LPF (to compensate delay)
%  ==================================

delay=2.5*N;

figure(f1)
subplot(313),plot(aux_fine-delay,x4_sharp_t(1:10*N),'g--','LineWidth',2)

figure(f3)
plot(aux_fine-delay,x4_sharp_t(1:10*N),'g--','LineWidth',2)


%% OPEN
%  ==================================
% a) Improve scaling of LPF responses!
%     Need to check energy of each impulse response and normalise answers.
%  ==================================
% b) Check/explain delay relative to length of sinc response