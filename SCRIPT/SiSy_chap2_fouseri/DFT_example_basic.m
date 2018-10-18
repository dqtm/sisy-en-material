% Basics of DFT (w/function FFT)
% ============================
clear all, close all, clc;

% PARAMETERS
N = 4;
Fs = 4;    

aux = 0:1:N-1;
tstep = 1/Fs;
fstep = Fs/N;

t = aux*tstep;
f = aux*fstep;

% FUNCTIONS
x_t = sin(2*pi*1*t);
X_k = (1/N)*fft(x_t);

% PLOTS
% Open figure with specific properties
% Position: [left bottom width height] &  Name: 'string'
scrsz = get(groot,'ScreenSize'); 
figure('Position',[0.1*scrsz(3)  0.2*scrsz(4) 0.7*scrsz(3) 0.6*scrsz(4)], ...
       'Name','Basics of DFT: Single Sine Function' )

% LEFT SIDE : Time Domain
subplot(221),plot(t,x_t,'k--'),hold on,grid minor
             stem(t,x_t,'rs'),hold off,xlim([0 N*tstep])
             xlabel('t = n*t_{step} (sec)'),ylabel('x(t)'),legend({'x(t)','x(n*t_{step})'})
             title('Time Domain')
subplot(223),plot(aux,x_t,'k--'),hold on,grid minor
             stem(aux,x_t,'rs'),hold off,xlim([0 N])
             xlabel('n (index)'),ylabel('x[n]')

% RIGHT SIDE : Frequency Domain                         
subplot(222),stem(f,abs(X_k)),grid minor,xlim([0 N*fstep])
             xlabel('f = k*f_{step} (Hz)'),ylabel('| X(k) |  (Amp)')
             title('Frequency Domain')
subplot(224),stem(f,180/pi*angle(X_k)),grid minor,xlim([0 N*fstep])
             xlabel('f = k*f_{step} (Hz)'),ylabel('< X(k)  (Phase)')



%% GOODIES FOR CLEARER PLOTS
% ===============================================
% (1) SET X_k TO ZERO WHEN AMP<EPS (floating point accuracy)
% ===============================================
mask = double(abs(X_k)>2*eps);
X_k = X_k.*mask;


% ===============================================
% (1) SHIFTING RANGE FROM 0<=>Fs  TO -Fs/2<=>+Fs/2
% ===============================================
X_k_shift = fftshift(X_k);
aux_shift = -N/2:1:N/2-1;
f_shift = fstep*aux_shift;


scrsz = get(groot,'ScreenSize'); 
figure('Position',[0.1*scrsz(3)  0.2*scrsz(4) 1*scrsz(3) 0.6*scrsz(4)], ...
       'Name','Basics of DFT + Plot Goodies : Single Sine Function' )

% LEFT SIDE : Time Domain
subplot(231),plot(t,x_t,'k--'),hold on,grid minor
             stem(t,x_t,'rs'),hold off,xlim([0 N*tstep])
             xlabel('t = n*t_{step} (sec)'),ylabel('x(t)'),legend({'x(t)','x(n*t_{step})'})
             title('Time Domain')
subplot(234),plot(aux,x_t,'k--'),hold on,grid minor
             stem(aux,x_t,'rs'),hold off,xlim([0 N])
             xlabel('n (index)'),ylabel('x[n]')

% MIDDLE : Frequency Domain                         
subplot(232),stem(f,abs(X_k)),grid minor,xlim([0 N*fstep])
             xlabel('f = k*f_{step} (Hz)'),ylabel('| X(k) |  (Amp)')
             title('Frequency Domain')
subplot(235),stem(f,180/pi*angle(X_k)),grid minor,xlim([0 N*fstep])
             xlabel('f = k*f_{step} (Hz)'),ylabel('< X(k)  (Phase)')

% RIGHT SIDE : Frequency Domain Shifted                         
subplot(233),stem(f_shift,abs(X_k_shift)),grid minor,xlim([-N/2*fstep +N/2*fstep])
             xlabel('f = k*f_{step} (Hz)'),ylabel('| X(k_{shift}) |  (Amp)')
             title('Frequency Domain Shifted')
subplot(236),stem(f_shift,180/pi*angle(X_k_shift)),grid minor,xlim([-N/2*fstep +N/2*fstep])
             xlabel('f = k*f_{step} (Hz)'),ylabel('< X(k_{shift})  (Phase)')

