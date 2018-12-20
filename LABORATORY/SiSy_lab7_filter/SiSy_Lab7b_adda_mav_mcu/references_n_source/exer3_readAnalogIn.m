% ===================================
% SiSy HS12 Lab7 exercise-3 _dqtm
% connect to Arduino and read analog input via ADC
% ===================================

% can comment out the next 2commands after 1st execution, and in case you
% want to keep the connection to the Arduino
clear all, close all, clc   
a=arduino('COM4')       % do not forget to update here your port number!!

N=100;
aux=0:1:N-1;
val = zeros(1,N);

while(1)
    for id=1:1:N
    val(id)= a.analogRead(0);
    end    
    figure(1)
    plot(aux,val),grid on
    pause(2);
end 
