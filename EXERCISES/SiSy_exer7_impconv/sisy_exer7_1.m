% SiSy Ueb3 Auf1 - dqtm 08.Okt.2012
% =====================================
clear all, close all, clc;

t = 0:0.1:12;               % andere Lösungen möglich
x_t = 10*exp(-t/4);         % wie Entladungskurve eines System 1te Ordnung
y_t = x_t.*sin(2*pi*3/4*t); % Elementewise Multiplikation von Hüllkurve und Schwingung

figure(1)
plot(t,x_t,'r--',t,y_t,'b-')
grid on
xlabel('\rightarrow t (s) ')
title('Signals in time domain')
legend('x(t)','y(t)')


h_t = 0.1*(cumsum([0 y_t(1:end-1)]));
figure(2)
plot(t,h_t), grid on
xlabel('t \rightarrow')
title('Step Response num.approx')

% check
sigma_e = 1/4;
omega_e = 2*pi*3/4;
sys = zpk([],[-sigma_e+j*omega_e,-sigma_e-j*omega_e],[2.077*omega_e^2])
figure(3)
subplot(121),impulse(sys)
subplot(122),step(sys)
