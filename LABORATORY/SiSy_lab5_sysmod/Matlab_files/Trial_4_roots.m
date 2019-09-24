% trial 2 tones close by 
% Approx of oscillating system 4th order
% ==========================
% remember from trigonometry
% ==========================
% cos(alpha)*cos(beta) = 
% = 1/2 * [cos(alpha-beta) + cos(alpha+beta)]

clear all, close all, clc;


s1 = -0.2 + j*2*pi*(10-0.25);
s2 = conj(s1);

s3 = -0.2 + j*2*pi*(10+0.25);
s4 = conj(s3);

t = 0:0.01:6;

x_t = 1/4*(exp(s1*t) + exp(s2*t)) + ...
      1/4*(exp(s3*t) + exp(s4*t));

figure(1)
plot(t,x_t),grid on

