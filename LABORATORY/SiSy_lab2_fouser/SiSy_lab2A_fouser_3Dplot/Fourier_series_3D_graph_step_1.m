% SiSy Lab2A : 3D plot for Fourier Series exercise
% ================================================
clear all, close all, clc;

% PARAMETERS
T = 1 ;             % period
M = 9;              % number of harmonics
% ==================
% WORK HERE!!!
% ==================
% YOU NEED TO DEFINE:
% tstep    % time resolution, such that highest harmonic has 20 points/period
% t        % time vector with 2 complete periods of periodic function


% FUNCTIONS
% initialise a variable before using it within loop
x_t = zeros(1,length(t));   % vector to store sum of harmonics
a_k = zeros(1,M);           % amplitude sinus coefficients
b_k = zeros(1,M);           % amplitude cosinus coefficients


for k=1:M
    % ==================
    % WORK HERE!!!
    % ==================
    % Define Fourier coeffs
    
    % ==================
    % WORK HERE!!!
    % ==================
    % Calculate sum of harmonics x_t 
        
    % ==================
    % WORK HERE!!!
    % ==================
    % plot new sum, plus define appropriated axis()
    
    % before next iteration
    pause(2);
end

