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
M_t = zeros(M,length(t));   % matrix to store single harmonics
a_k = zeros(1,M);           % amplitude sinus coefficients
b_k = zeros(1,M);           % amplitude cosinus coefficients

% Open figure with specific
% Position Property: [left bottom width height]
scrsz = get(groot,'ScreenSize'); 
figure('Position',[1 0.6*scrsz(4) 0.8*scrsz(3) 0.3*scrsz(4)])

for k=1:M
    
	% Define Fourier coeffs
	if (mod(k,2))
        b_k(k) =  1/k;
	end
   
	% calculate single harmonic
    M_t(k,:) = a_k(k)*cos(2*pi*k*t/T) + b_k(k)*sin(2*pi*k*t/T);
    
    % Calculate sum of harmonics x_t 
    x_t = x_t + M_t(k,:);
    
    % plot single harmonics
    subplot(121),plot3(t,k*ones(1,length(t)),M_t(k,:))
       grid on,hold on,view(65,50);
       xlabel('t'),ylabel('k-harmonics')
    
    % plot new sum, plus define appropriated axis()
    subplot(122),plot(t,x_t),grid on, axis([0,2*T,-2,2])
        xlabel('t'),ylabel('x(t)')
    
    % before next iteration
    pause(1);
end
title('Synthesis with Fourier Series')


