% ==========================================
% Convolution Demo
% ==========================================
clear; close all; clc;

% PARAMETERS
N=100;
Ts=1e-2;

time=[0:2*N]*Ts;
x=[0 ones(1,N) zeros(1,N)];
xrev=fliplr(x);
y=zeros(1,2*N+1);

for n=1:2*N,
subplot(2,1,1);
plot(time,x,time-2+n*Ts,xrev,'--','LineWidth',3.0); grid;
xlabel('time \lambda (sec)'); ylabel('x(\lambda) and x(t-\lambda)'); axis([-1 2 0 1.1])
if n<N,
   y(1+n)=n*Ts;
else
   y(1+n)=(2*N-n)*Ts;
end
subplot(2,1,2);
plot(time,y,'LineWidth',3.0); grid;
xlabel('time t  (sec)'); ylabel('y(t)'); axis([-1 2 0 1.1])
pause(0.01)
end
subplot(211),title('Demo Convolution')