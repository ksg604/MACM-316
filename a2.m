%%% Kevin San Gabriel
%%% 301342241
%%% MACM 316 D100 Benjamin Adcock
%%% Computing Assignment 1

N_vals = [1, 10, 100, 1000, 2000, 5000, 10000];

num_trials = length(N_vals);
dim = size(N_vals);


%%%
%%% Case 1
%%%

GE_error = zeros(dim);    %Array of error values for GE trials
GE_times = zeros(dim);    %Array of timing data for GE trials
QR_error = zeros(dim);    %Array of error values for QR trials
QR_times = zeros(dim);    %Array of timing data for QR trials


%Generate errors and times for GE
for i = 1:num_trials
    N_val = N_vals(i);
    A = randn(N_val);
    x = ones(N_val, 1);
    b = A*x;
    
    tic;
    xhat_GE = A\b;
    GE_times(i) = toc;
    GE_error(i) = max(abs(xhat_GE-x));
 
    tic;
    [Q,R] = qr(A);
    xhat_QR = R\(transpose(Q)*b);
    QR_times(i) = toc;
    QR_error(i) = max(abs(xhat_QR-x));
end

figure(1);
title('E_N vs N: Error comparison between GE and QR (Case 1)');
xlabel('N');
ylabel('E_N');

hold on;
plot(N_vals, GE_error);
plot(N_vals, QR_error);
hold off;
legend('Gaussian Elimination (GE)','QR Factorization (QR)');

figure(2);
title('T_N vs N: Time comparison between GE and QR (Case 1)');
xlabel('N');
ylabel('T_N (seconds)');
hold on;
plot(N_vals, GE_times);
plot(N_vals, QR_times);
hold off;
legend('Gaussian Elimination (GE)', 'QR Factorization (QR)');

%%%
%%% Case 2
%%%

%Reset our error and times storage arrays for the A = B^T*B case
GE_error = zeros(dim);    
GE_times = zeros(dim);    
QR_error = zeros(dim);    
QR_times = zeros(dim);   


%A = B^T*B case for GE 
for i = 1:num_trials
    N_val = N_vals(i);
    B = randn(N_val);
    A = transpose(B)*B;
    x = ones(N_val, 1);
    b = A*x;
    
    tic;
    xhat_GE = A\b;
    GE_times(i) = toc;
    GE_error(i) = max(abs(xhat_GE - x));
    
    tic; 
    [Q,R] = qr(A);
    xhat_QR = R\(transpose(Q)*b);
    QR_times(i) = toc;
    QR_error(i) = max(abs(xhat_QR - x));
    
end

figure(3);
title('E_N vs N: Error comparison between GE and QR (Case 2)');
xlabel('N');
ylabel('E_N');

hold on;
plot(N_vals, GE_error);
plot(N_vals, QR_error);
hold off;
legend('Gaussian Elimination (GE)','QR Factorization (QR)');

figure(4);
title('T_N vs N: Time comparison between GE and QR (Case 2)');
xlabel('N');
ylabel('T_N (seconds)');
hold on;
plot(N_vals, GE_times);
plot(N_vals, QR_times);
hold off;
legend('Gaussian Elimination (GE)', 'QR Factorization (QR)');

