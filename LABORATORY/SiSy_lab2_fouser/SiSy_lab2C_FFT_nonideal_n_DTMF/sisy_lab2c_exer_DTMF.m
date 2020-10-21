% Lab2C Aufgabe 2 _ SiSy HS20 _ dqtm
% =================================
clear all, close all, clc;

% LOAD .MAT FILE
      % ========> HERE COMES YOUR CODE

% Data file contains:
% Fs, sig

% Listen to registered signal
     % ========> HERE COMES YOUR CODE

%% Plot complete signal in time domain
% Observation:
% N_total =  number of points in the complete audio data (with 9 tones and 8 pauses)
% N          =  number of points in the data slices on which we apply the fft()

Ts =      % ========> HERE COMES YOUR CODE
N_total = length(sig);
aux_total = 0:1:N_total-1;
t_total = Ts*aux_total;

% sig has 9 tones and 8 pauses
figure(1)
plot(t_total,sig), grid on, xlabel('t (s)')

% Estimate with the cursor the length of each tone and each pause
T_tone =    % ========> HERE COMES YOUR CODE
N = round(T_tone/Ts) ;      % number of points for fft

T_pause = % ========> HERE COMES YOUR CODE
N_pause = % ========> HERE COMES YOUR CODE   % number of points to skip before next tone
    
% Prepare variables for loop analyzing tone-by-tone
aux = 0:1:N-1;
f = (Fs/N)*aux;     % freq vector for X[k]

% checking first manually for 1st tone
X_f = (1/N)*fft(sig(1:N));
figure(2) % Generate a plot of amplitude spectrum
% ========> HERE COMES YOUR CODE
    grid on, xlabel('f (Hz)')

peak_vec = double(abs(X_f)>0.1); 
% sometimes have "double-pics", so can do
[pks locs]=findpeaks(peak_vec(1:N/2),'MinPeakDistance',5)
tones = f(locs)

figure(3) % Generate a plot of peak_vec to control outcome
% ========> HERE COMES YOUR CODE

%% Could also continue "manual" check.
% Below a possibility to analyse all 9 tones with a loop

% Making loop for all 9 digits
display('Loop identifying call-digits')
tones_matrix = zeros(9,2);
for id=1:1:9
    start = 1 + (id-1)*(N+N_pause);
    stop = start + N;
    X_f = % ========> HERE COMES YOUR CODE
    
    % ========> HERE COMES YOUR CODE

end     

display('Freq values of tones:')
disp(tones_matrix)
    
    