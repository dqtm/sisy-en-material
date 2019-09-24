% SiSy1 Prak6 - Aufgabe-4 Klang Synthese
% =================================
clear all, close all, clc;

% Define Constants
Fs = 22050;   % Hz
Ts = 1/Fs;    % s

% Load and hear to reference sound
load Glas
sound(y,fs)

% Analyse reference sound with DFT
N =     1;  % Bitte ueberschreiben
Y =     1;  % Bitte ueberschreiben
Y_dB =  1;  % Bitte ueberschreiben

% Declare aux, time and freq vectors
aux =   1;  % Bitte ueberschreiben
f =     1;  % Bitte ueberschreiben
t =     1;  % Bitte ueberschreiben 

% Plot Reference Sound in time & freq domains
figure(1)
plot(t,y),grid;

figure(2)
plot(f,Y_dB),grid;
disp('Pause before zooming in on peaks')
pause(3)
axis([0 Fs/2 max(Y_dB)-30 max(Y_dB)+2])

%%
% Synthesize sound with Sum of sinus * envelope curve

% Declare frequence and amplitude of relevant tones
% Check for "twin"-peaks 
% ....  % Bitte ueberschreiben 

% Sum up sinus-signals (each with respective frequency & amplitude)
x=zeros(1,N);    % Bitte ueberschreiben 
 

% Point-Multiply (gewichten) the sum of sinus with envelope curve
x=zeros(1,N);    % Bitte ueberschreiben 


% Play Synthesised Sound and Replay original for comparison
sound(x',Fs);
pause(2)
sound(y,Fs)


% check your envelope curve by superposing it to figure 1
% ..... to be completed