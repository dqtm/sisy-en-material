% ==========================================
% Convolution Demo : to show y = x conv g  
% ==========================================
clear; close all; clc;

% PARAMETERS
N=100;
Ts=1e-2;
tau = Ts*50;
time=[0:2*N]*Ts;

% FUNCTIONS 
x=[0 ones(1,N) zeros(1,N)];

% g= x;     % another option for input fct
g = 1/tau * exp(-time/tau);
g(1) = 0;  % for better visualisation of start value

y=zeros(1,2*N+1);
yconv = conv(x,g)*Ts;
% Comments/questions: 
% 1) Check the lenght of yconv vector, and explain what it comes from
% 2) How can a discrete convolution calculation approximate the continuous case?

figure('Name','Convolution-Demo: Inputs and Output','Position',[1 300 500 300]);
plot(time,x,'b',time,g,'r',time,yconv(1:2*N+1),'m'), xlabel('time (sec)')
legend({'input x(t)','input g(t)','output y(t)'}), grid on
pause(2);

figure('Name','Convolution-Demo: Progression','Position',[500 300 500 300]);
grev=fliplr(g);       % flipped g(t) for plot of convolution progression
for n=1:2*N,
    subplot(2,1,1);
    plot(time,x,time-2+n*Ts,grev,'--','LineWidth',3.0); grid;
    xlabel('time \lambda (sec)'); ylabel('x(\lambda) and g(t-\lambda)'); axis([-1 2 0 2.1])
    y(1+n) = yconv(1+n);
    subplot(2,1,2);
    plot(time,y,'LineWidth',3.0); grid;
    xlabel('time t  (sec)'); ylabel('y(t)'); axis([-1 2 0 1.1])
    pause(0.01)
end
subplot(211),title('Demo Convolution')