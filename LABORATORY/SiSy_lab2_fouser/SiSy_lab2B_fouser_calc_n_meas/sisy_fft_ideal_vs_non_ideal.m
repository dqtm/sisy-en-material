% FFT Ideal versus Non-Ideal _ dqtm SiSy HS14
% Examples to see where "noise" arises
% ===========================
clear all, close all, clc


%%  (A) The ideal situation!
% You know the frequency of the input signal
% and can select the sampling frequency: Fs=M*fsig
% and the length of the observation window as N*Ts = P*Tsig
% ===========================
fsig = 1e3;
duty = 50;     % duty cycle for periodic square
M = 2^5;       % Number of sampling points per period of Fsig
P = 2;         % Length of observation window = 20*Period of input-signal

Fsa = M*fsig;    % sampling frequency is a multiple of the input-signal freq
Tsa = 1/Fsa;

Na = P*Fsa/fsig;   % Calculate number of points in buffer for FFT-Analysis
                   % N = P*Tsig/Ts = P*Fs/fsig
Tw = Na*Tsa;

aux = 0:1:Na-1;
ta = Tsa*aux;         % tstep*index-vector
fa = (Fsa/Na)*aux;     % fstep*index-vector

xa_t = square(2*pi*fsig*ta,duty);
Xa_f = (1/Na)*fft(xa_t);

figure('Name','(A) FFT in Ideal Situation')
subplot(121),plot(ta,xa_t,'-bo'),grid on,hold on
            xlabel('time (s) \rightarrow')
            ylim([-2 2])
subplot(122),plot(fa,abs(Xa_f),'-bo'),grid on,hold on
            xlabel('frequency (Hz) \rightarrow')
            
%%  Everything else: non-ideal situations!
% (B) Fs is not a multiple of fsig: (Fs) /= (M*fsig)
% (C) The observation window is not a multiple of Tsig: (N*Ts) /= (P*Tsig)
% (D) Both (Fs) /= (M*fsig) and (N*Ts) /= (P*Tsig)


%% (B) Fs is not a multiple of fsig: (Fs) /= (M*fsig)
Fsb = M*1.148*fsig; % sampling frequency is NOT multiple of the input-signal freq
Tsb = 1/Fsb;

Nb = round(Tw/Tsb);   % Calculate number of points in buffer for FFT-Analysis
                      % keeping length of observation window fix
aux = 0:1:Nb-1;
tb = Tsb*aux;         % tstep*index-vector
fb = (Fsb/Nb)*aux;     % fstep*index-vector

xb_t = square(2*pi*fsig*tb,duty);
Xb_f = (1/Nb)*fft(xb_t);

figure('Name','(B) FFT in Non-Ideal Situation : Fs not multiple of fsig')
subplot(121),plot(tb,xb_t,'-ro'),grid on,hold on
            xlabel('time (s) \rightarrow')
            ylim([-2 2])
subplot(122),plot(fb,abs(Xb_f),'-ro'),grid on,hold on
            xlabel('frequency (Hz) \rightarrow')


    
%% (C) The observation window is not a multiple of Tsig: (N*Ts) /= (P*Tsig)    

fsig_c = fsig*1.072;

Fsc = Fsa;    % sampling frequency is a multiple of the input-signal freq
Tsc = 1/Fsc;

Nc = round(Tw/Tsc);   % Calculate number of points in buffer for FFT-Analysis
                      % keeping length of observation window fix

aux = 0:1:Nc-1;
tc = Tsc*aux;         % tstep*index-vector
fc = (Fsc/Nc)*aux;     % fstep*index-vector

xc_t = square(2*pi*fsig_c*tc,duty);
Xc_f = (1/Nc)*fft(xc_t);

                % OPTION: use windowing
                % but only makes sense for long Tw, e.g P=10
% xcw_t = hann(length(tc))'.*xc_t;  
% Xcw_f = (1/Nc)*fft(xcw_t);


figure('Name','(C)FFT in Non-Ideal Situation : Tw not multiple of Tsig')
subplot(121),plot(tc,xc_t,'-go'),grid on,hold on
             %plot(tc,xcw_t,'-co')
            xlabel('time (s) \rightarrow')
            ylim([-2 2])
subplot(122),plot(fc,abs(Xc_f),'-go'),grid on,hold on
            %plot(fc,abs(Xcw_f),'-co')
            xlabel('frequency (Hz) \rightarrow')
            
%% ===========================            
% PLOT OF COMPARISONS            
% ============================
% Compare Spectra in Linear scale
figure('Name','Compare FFT Amplitude-Spectra in Linear scale')
    % (A) Ideal
    plot(fa,abs(Xa_f),'-bo'),grid on,hold on
    % (B) Non-Ideal
    plot(fb,abs(Xb_f),'-ro'),grid on,hold on
    % (C) Non-Ideal
    plot(fc,abs(Xc_f),'-go'),grid on,hold on
    xlabel('frequency (Hz) \rightarrow')
    legend({'(A)Ideal','(B)Non-Ideal','(C)Non-Ideal'})     
            
% Compare Spectra in dB scale
figure('Name','Compare FFT Amplitude-Spectra in dB scale')
    % (A) Ideal
    plot(fa,db(Xa_f),'-bo'),grid on,hold on
    % (B) Non-Ideal
    plot(fb,db(Xb_f),'-ro'),grid on,hold on
    % (C) Non-Ideal
    plot(fc,db(Xc_f),'-go'),grid on,hold on
    xlabel('frequency (Hz) \rightarrow')
    legend({'(A)Ideal','(B)Non-Ideal','(C)Non-Ideal'})              