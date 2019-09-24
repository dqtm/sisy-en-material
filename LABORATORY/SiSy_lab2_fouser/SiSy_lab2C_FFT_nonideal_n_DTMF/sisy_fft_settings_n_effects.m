% FFT Practical _ settings & effects _ dqtm SiSy HS14
% What can you do: AA-filter, windowing, long-obs-interval, zero-padding
% ===========================
clear all, close all, clc

% Let us take a fix Fs, not multiple of fsig and check how 
% we can improve the spectrum measurement
% ============================
% (A) The basic situation: rectangle window
% (B) Increasing window size
% (C) Adding AAf
% (D) Adding Windowing (Hanning)
% (E) Zero-Padding
% ============================


%% (A) The basic situation: rectangle window
% ============================
Fs = 20e3;  %30e3;
N =  2^7;   %2^8 ; 

aux = 0:1:N-1;
t = (1/Fs)*aux;
f = (Fs/N)*aux;

fsig = 1.5e3; % 1.0e3;
duty = 50;
x_t = square(2*pi*fsig*t,duty);
X_f = (1/N)*fft(x_t);

figure('Name','(A) The basic Situation')
subplot(121),plot(t,x_t,'-bo'),grid on,hold on
            xlabel('time (s) \rightarrow')
            ylim([-2 2])
subplot(122),plot(f,abs(X_f),'-bo'),grid on,hold on
            xlabel('frequency (Hz) \rightarrow')


%% (B) Increasing window size
% ============================
Nb = N*2^2;

auxb = 0:1:Nb-1;
tb = (1/Fs)*auxb;
fb = (Fs/Nb)*auxb;

xb_t = square(2*pi*fsig*tb,duty);
Xb_f = (1/Nb)*fft(xb_t);

figure('Name','(B) Increasing window size')
subplot(121),plot(tb,xb_t,'-ro'),grid on,hold on
            xlabel('time (s) \rightarrow')
            ylim([-2 2])
subplot(122),plot(fb,abs(Xb_f),'-ro'),grid on,hold on
            xlabel('frequency (Hz) \rightarrow')

%% (C) Adding AAf
% ============================

[b,a] = butter(2,0.45);
xc_t = filter(b,a,x_t);

Xc_f = (1/N)*fft(xc_t);

figure('Name','(C) Adding AAF')
subplot(121),plot(t,xc_t,'-go'),grid on,hold on
            xlabel('time (s) \rightarrow')
            ylim([-2 2])
subplot(122),plot(f,abs(Xc_f),'-go'),grid on,hold on
            xlabel('frequency (Hz) \rightarrow')




%% (D) Adding Windowing (Hanning)
            
win = hann(length(t))';
xd_t = win.*x_t;

Xd_f = (1/N)*fft(xd_t);

figure('Name','(C) Windowing')
subplot(121),plot(t,xd_t,'-ko'),grid on,hold on
            xlabel('time (s) \rightarrow')
            ylim([-2 2])
subplot(122),plot(f,abs(Xd_f),'-ko'),grid on,hold on
            xlabel('frequency (Hz) \rightarrow')


%% (E) Zero-Padding
% to compare with (B), using same number of points: Ne = Nb;

% auxb = 0:1:Nb-1;
% tb = (1/Fs)*auxb;
% fb = (Fs/Nb)*auxb;
%xe_t(1:N) = x_t;
xe_t(1:N) = x_t.*hann(length(t))';
xe_t(N+1:Nb) = zeros(1,Nb-N);
Xe_f = (1/N)*fft(xe_t);


figure('Name','(E) Zero-Padding')
subplot(121),plot(tb,xe_t,'-mo'),grid on,hold on
            xlabel('time (s) \rightarrow')
            ylim([-2 2])
subplot(122),plot(fb,abs(Xe_f),'-mo'),grid on,hold on
            xlabel('frequency (Hz) \rightarrow')
            

            
%%  PLOT OF COMPARISONS            
% ============================
% Compare Spectra in Linear scale
figure('Name','Compare FFT Amplitude-Spectra in Linear scale')
    % (A) Basic
    plot(f,abs(X_f),'-bo'),grid on,hold on
    % (B) Longer Obs-wdw
    plot(fb,abs(Xb_f),'-ro'),grid on,hold on
    % (C) Adding AAF
    plot(f,abs(Xc_f),'-go'),grid on,hold on
    % (D) Windowing
    plot(f,abs(Xd_f),'-ko'),grid on,hold on
    % (E) Zero-Padding
    plot(fb,abs(Xe_f),'-mo'),grid on,hold on
    
    xlabel('frequency (Hz) \rightarrow')
    legend({'(A)Basic','(B)Longer Tw','(C)Added AAF','(D) Han-Wdw','(E) Zero-Padding'})     
            
% Compare Spectra in dB scale
figure('Name','Compare FFT Amplitude-Spectra in dB scale')
    % (A) Basic
    plot(f,db(X_f),'-bo'),grid on,hold on
    % (B) Longer Obs-wdw
    plot(fb,db(Xb_f),'-ro'),grid on,hold on
    % (C) Adding AAF
    plot(f,db(Xc_f),'-go'),grid on,hold on
    % (D) Windowing
    plot(f,db(Xd_f),'-ko'),grid on,hold on
    % (E) Zero-Padding
    plot(fb,db(Xe_f),'-mo'),grid on,hold on
    
    xlabel('frequency (Hz) \rightarrow')
    legend({'(A)Basic','(B)Longer Tw','(C)Added AAF','(D) Han-Wdw','(E) Zero-Padding'})     
