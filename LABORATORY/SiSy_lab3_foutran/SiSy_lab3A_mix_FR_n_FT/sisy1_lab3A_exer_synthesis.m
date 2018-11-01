% SiSy1 Prak6 - Aufgabe-4 Klang Synthese
% =================================
clear all, close all, clc;

% Define Constants
Fs = 22050;   % Hz
Ts = 1/Fs;    % s

% Load and hear to reference sound
load Glas
sound(y_t,fs)

% Analyse reference sound with DFT
N =     1;  % Bitte ueberschreiben
Y_f =     1;  % Bitte ueberschreiben
Y_f_dB =  1;  % Bitte ueberschreiben

% Declare aux, time and freq vectors
aux =   1;  % Bitte ueberschreiben
f =     1;  % Bitte ueberschreiben
t =     1;  % Bitte ueberschreiben 

% Plot Reference Sound in time & freq domains
figure(1)
plot(t,y_t),grid;

figure(2)
plot(f,Y_f_dB),grid;
disp('Pause before zooming in on peaks')
pause(3)
axis([0 Fs/2 max(Y_f_dB)-30 max(Y_f_dB)+2])

%%
% Synthesize sound with Sum of sinus * envelope curve

% Declare frequence and amplitude of relevant tones
% Check for "twin"-peaks 
% ....  % Bitte ueberschreiben 

% Sum up sinus-signals (each with respective frequency & amplitude)
x_t = zeros(1,N);    % Bitte ueberschreiben 
 

% Point-Multiply (gewichten) the sum of sinus with envelope curve
x_t = zeros(1,N);    % Bitte ueberschreiben 


% Play Synthesised Sound and Replay original for comparison
sound(x_t',Fs);
pause(2)
sound(y_t,Fs)


% check your envelope curve by superposing it to figure 1
% ..... to be completed