% Audio Harmonic Outputs vs. Phase
clear all, close all, clc;

Fs = 48e3;
N = (1/2)*Fs;       % number of points for t vector

aux = 0:1:N-1;
Ts = (1/Fs);
t = Ts*aux;

A = 4/pi;
fsig = 250;
x1_t = 1;           % here comes your code!
x3_t = 1;           % here comes your code!
x5_t = 1;           % here comes your code!

xa_t = 1;           % here comes your code!
xb_t = 1;           % here comes your code!

figure()
plot(t,xa_t,'b',t,xb_t,'r'),grid on
disp('zoom on first 2 periods'), pause(1), xlim([0 2/fsig])
xlabel('time'),ylabel('time functions'),legend({'x_a(t)','x_b(t)'})

sound(xa_t,Fs);
pause(2)
sound(xb_t,Fs);

% here comes your code!