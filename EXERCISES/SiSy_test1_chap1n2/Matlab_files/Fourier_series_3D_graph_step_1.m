% SiSy Lab2A : 3D plot for Fourier Series exercise
% ================================================
clear all, close all, clc;

% PARAMETERS
T = 1 ;             % period
M = 15;             % number of harmonics
tstep = T/(M*20);   % time resolution, such that highest harmonic has 20 points/period
t = 0:tstep:2*T;    % time vector with 2 complete periods of periodic function


% FUNCTIONS
% initialise a variable before using it within loop
x_t = zeros(1,length(t));   % vector to store sum of harmonics
a_k = zeros(1,M);           % amplitude sinus coefficients
b_k = zeros(1,M);           % amplitude cosinus coefficients


for k=1:M

    % Define Fourier coeffs
    b_k(k) =  1/k;
   
    % Calculate sum of harmonics x_t 
    x_t = x_t + a_k(k)*cos(2*pi*k*t/T) + b_k(k)*sin(2*pi*k*t/T);
    
    % plot new sum, plus define appropriated axis()
    plot(t,x_t),grid on, axis([0,2*T,-2,2])
    
    % before next iteration
    pause(0.2);
end

xlabel('t (sec)'),ylabel('x(t)')