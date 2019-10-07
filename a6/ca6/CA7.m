%Part 1

n = 50;
Q_arr = zeros(n,1);

I = @(x) ((sin((x.^(-1)).*log(x)))./x);

for n = 50:50:500

    %Calculate Qn
    I_arr = zeros(n,1);

    a = zeros(n+1,1);

    for i = 1:n+1
        b = fzero(@(x) x*exp(x)-i*pi,0);
        a(i) = exp(-b);
    end
    
    format long;
    I_arr(1) = integral(I,a(1),1);

    for i = 1:n
        I_arr(i+1) = integral(I,a(i+1),a(i));
    end

    format long;
    Q_n = sum(I_arr);

    %Calculate Qn+1
    I_arr1 = zeros(n+2,1);

    a1 = zeros(n+2,1);

    for i = 1:n+2
        b = fzero(@(x) x*exp(x)-i*pi,0);
        a1(i) = exp(-b);
    end

    format long;
    I_arr1(1) = integral(I,a1(1),1);

    for i = 1:n+1
        I_arr1(i+1) = integral(I,a1(i+1),a1(i));
    end

    format long;
    Q_n1 = sum(I_arr1);

    %Calculate Qn+2
    I_arr2 = zeros(n+3,1);

    a2 = zeros(n+3,1);

    for i = 1:n+3
        b = fzero(@(x) x*exp(x)-i*pi,0);
        a2(i) = exp(-b);
    end

    format long;
    I_arr2(1) = integral(I,a2(1),1);

    for i = 1:n+2
        I_arr2(i+1) = integral(I,a2(i+1),a2(i));
    end

    Q_n2 = sum(I_arr2);

    format long;
    Qhat_n = Q_n - (((Q_n1 - Q_n).^2)/(Q_n2-2*Q_n1 + Q_n));

    disp(n);
    disp(Q_n);
    disp(Qhat_n);
    
end
