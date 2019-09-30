% CDMA Principle: short binary message spread with a key-sequence (spreading code)
% Objective: retrieve & differentiate each message below noise floor
% ==============================

% STEP-1 : Short message & sequence, checking spreading principle
% STEP-2 : Longer message & sequence + noise
% STEP-3 : Several spread-messages + noise

%% STEP-1 : Short message & sequence, checking spreading principle
clear all, close all, clc;

% PARAMETERS
N_msg = 3;      
N_seq = 5;     

% DEFINITIONS
msg = sign(randn(1,N_msg))
spread_seq = sign(randn(1,N_seq))

% Spreading the message means: each message bit sets the polarity of the spread sequence
spread_matrix = msg'*spread_seq 

% Reshape is taking the elements column-by-column,
% so needed to transpose spread_matrix before reshaping
% because the spread values were in the lines
signal = reshape(spread_matrix',[1,N_msg*N_seq])
noise = 0; % start without noise
spn = signal + noise;

MaxID = N_msg*N_seq;    % Max-Id for plot of message + noise
figure()
subplot(311),stem(signal),xlim([0 MaxID]),ylabel('spread message')
subplot(312),plot(noise),xlim([0 MaxID]),grid on,ylabel('noise')
subplot(313),plot(spn),xlim([0 MaxID]),grid on,ylabel('msg+noise')

% Calculate Correlation with spread-sequence
Rm_seq = xcorr(spn,spread_seq);

figure(),plot(Rm_seq),grid on, ylabel('Correlation with Key-Seq')

%% STEP-2 : Longer message & sequence + noise
clear all, close all, clc;

% PARAMETERS
N_msg = 10;      
N_seq = 200;   

% DEFINITIONS
msg = sign(randn(1,N_msg));
spread_seq = sign(randn(1,N_seq));

% Spread message with key-sequence
spread_matrix = msg'*spread_seq ;

% Form signal-vector plus add noise
signal = reshape(spread_matrix',[1,N_msg*N_seq]);
noise = 2*randn(1,N_msg*N_seq);
spn = signal + noise;

MaxID = 100;    % Max-Id for plot of message + noise
figure()
subplot(311),stem(signal),xlim([0 MaxID]),ylabel('spread message')
subplot(312),plot(noise),xlim([0 MaxID]),grid on,ylabel('noise')
subplot(313),plot(spn),xlim([0 MaxID]),grid on,ylabel('msg+noise')

% Calculate Correlation with spread-sequence
Rm_seq = xcorr(spn,spread_seq);

figure(),plot(Rm_seq),grid on, ylabel('Correlation with Key-Seq')


%% STEP-3 : Several spread-messages + noise
clear all, close all, clc;

% PARAMETERS
N_msg = 10;      
N_seq = 2^12;   

% DEFINITIONS
msg1 = sign(randn(1,N_msg));
msg2 = sign(randn(1,N_msg));

spread_seq1 = sign(randn(1,N_seq));
spread_seq2 = sign(randn(1,N_seq));

% check how uncorrelated are the spreading sequences
% more about this on chapter-2
Ortho12 = sum(spread_seq1.*spread_seq2)

% Each message is spread by a different key-sequence
% then spread-messages are added up
spread_matrix = msg1'*spread_seq1 + msg2'*spread_seq2 ;

% Form signal-vector plus add noise
signal = reshape(spread_matrix',[1,N_msg*N_seq]);
noise = 10*randn(1,N_msg*N_seq);
spn = signal + noise;

MaxID = 100;    % Max-Id for plot of message + noise

figure()
subplot(311),stem(signal),xlim([0 MaxID]),ylabel('Sum(spread-msgs)')
subplot(312),plot(noise),xlim([0 MaxID]),grid on,ylabel('noise')
subplot(313),plot(spn),xlim([0 MaxID]),grid on,ylabel('msgs+noise')

Rm1_seq = xcorr(spn,spread_seq1);
Rm2_seq = xcorr(spn,spread_seq2);

figure()
subplot(211),plot(Rm1_seq),grid on, ylabel('Xcor Seq-1')
subplot(212),plot(Rm2_seq),grid on, ylabel('Xcor Seq-2')
