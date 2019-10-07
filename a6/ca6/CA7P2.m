%Part 2
N_arr = zeros(0,30);
Qhat_arr = zeros(0,30);
pVal_arr = zeros(0,30);

k = 0; 
for n = 50:10:600
    k = k+1;
    pVal_arr(k) = n;
    
    I = @(x) (sin(power(x,-n).*log(x)))./x;
    a = zeros(0,n);
   
    for i = 1:n+1
        b = fzero(@(x) x*exp(x*n)-i*pi,0);
        a(i) = exp(-b);
    end

    I_arr = zeros(0, n);
    format long

    I_arr(1) = integral(I, a(1), 1); 
    for i = 1:n
        I_arr(i+1) = integral(I, a(i+1), a(i)); 
    end

    format long;
    Q_n = sum(I_arr);
    disp(Q_n);
    
    N_arr(i) = Q_n; 
   
    a2 = zeros(0,n+1);

    for i = 1:n+2
        b = fzero(@(x) x*exp(x*n)-i*pi,0);
        a2(i) = exp(-b);
    end

    I_arr1 = zeros(0, n+1);
    
    format long
    I_arr1(1) = integral(I, a2(1), 1);
    for i = 1:n+1
        I_arr1(i+1) = integral(I, a2(i+1), a2(i)); 
    end

    format long;
    Q_n1 = sum(I_arr1);

    a3 = zeros(0,n+2);
    
    for i = 1:n+3
        b = fzero(@(x) x*exp(x*n)-i*pi,0);
        a3(i) = exp(-b);
    end

    I_arr2 = zeros(0, n+2);
    
    
    format long
    I_arr2(1) = integral(I, a3(1), 1);
    
    for i = 1:n+2
        I_arr2(i+1) = integral(I, a3(i+1), a3(i)); 
    end

    format long;
    Q_n2 = sum(I_arr2);
    
    format long;
    Qhat_n = Q_n - (((Q_n1 - Q_n).^2)/(Q_n2-2*Q_n1 + Q_n));
    
    Qhat_arr(k) = Qhat_n; 
    
end

hold on; 
plot(pVal_arr,Qhat_arr,'linewidth',2.0);
hold off; 
set(gca, 'FontSize', 16);
xlabel('Value of p', 'fontsize',18);
ylabel('I(p)', 'fontsize', 18);
title('Figure 1: Exponent parameter p vs Integral I(p)'); 
grid on;