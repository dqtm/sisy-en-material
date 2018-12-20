% SiSy : Lab 7A _ template _ dqtm 
% =====================================
clear all, close all, clc;

% Declare continuous system
num = [.....];          % WORK HERE!!!
den = [.....];          % WORK HERE!!!
sys = tf(num,den);
figure(1)
bode(sys),grid
% Alternative to have plot with Hz
figure(1);
h = bodeplot(sys), grid on;
setoptions(h,'FreqUnits','Hz','PhaseVisible','off');

% Calculate & Plot "continuous" impulse response
figure(2);
impulse(sys),grid on , hold on;

% Declare discrete time and freq vectors
N = 2^7;
aux = ....;         % WORK HERE!!!

Ts = 1/8 ;          % Sample Period for discrete vector
tn = .... ;         % WORK HERE!!!      % Time vector with large (discrete steps)

Fs = (1/(Ts*N));    % Frequency step
fn = .... ;         % WORK HERE!!!      % Matching Frequency vector for fft()


% Calculate discrete impulse response
gn_s = .....;       % WORK HERE!!!

% Plot cont vs. discrete impulse responses
figure(2)
stem(tn,gn_s,'m')
axis([0 4 -1 1])
legend('g(t)','1/Ts*gs[n]')
xlabel('time [s]')
ylabel('Amplitude')
title('Continuous and discrete impulse responses')

% Define stimuli function u[n]: square
u_n = square(2*pi/6*tn);
%plot(tn,u_n)

% Calculate response to rectangular pulse via convolution with gs[n]
y_n = .....;         % WORK HERE!!!

% Declare long time vectors to match convolution output
tn_long = .... ;    % WORK HERE!!!

% Plot response functions
figure
subplot(2,1,1),stem(tn,u_n,'b'),grid
               axis([0 20 -1.5 1.5])
               xlabel('time [s]')
               ylabel('u[n]')
               title('Stimuli and Response (convolution)')
subplot(2,1,2),stem(tn_long,y_n,'r'),grid
               axis([0 20 -1.5 1.5])
               xlabel('time [s]')
               ylabel('y[n]')
               
% Calculate FFT of input and output functions
U_f = ....          % WORK HERE!!!
Y_f = ....          % WORK HERE!!! OBS.: take fft from first N-points of y_n


% Plot fft output
figure;
plot(fn,db(U_f),'b',fn,db(Y_f),'r'),grid
xlabel('frequency [Hz]')
ylabel('Magnitude [dB]')
legend('U(f) [dB]','Y(f) [dB]','Location','SouthEast')
