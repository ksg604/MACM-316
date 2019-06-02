
% (a)
function a = a1()
    e = exp(1);
    error_array = zeros(1, length(1:power(10,1):power(10,9)));
  
    i = 1;
    for n = 1:power(10,1):power(10,9)
        en = power((1+(1/n)),n); 
        error_array(i) = abs(e - en);
        i = i + 1;
    end

    semilogx(1:power(10,1):power(10,9), error_array);
    xlabel('n','fontsize',16);
    ylabel('Error','fontsize',16);
    title('Approximation error for n in equal increments of 10^1'); 
    legend('Approximation error');
    set(gca,'FontSize',14);
    
    a = "Computation complete.";
end 




% (b)
function a = a1()
    e = exp(1);
    error_array = zeros(1, 99);
    i = 1;
    
    for n = 1:99
        en = power((1+(1/power(2,n))),power(2,n)); 
        error_array(i) = abs(e - en);
        i = i + 1;
    end

    semilogx(power(2,1:99), error_array);
    xlabel('n','fontsize',16);
    ylabel('Error','fontsize',16);
    title('Approximation error for n where n is a power of 2');
    legend('Approximation error')
    set(gca,'FontSize',14);
    
    a = "Computation complete.";
end 

% (c)
function a = a1()
    
    c = 5;
    e = power(exp(1),c);
    error_array = zeros(1, length(1:power(10,1):power(10,9)));
  
    i = 1;
    for n = 1:power(10,1):power(10,9)
        en = power((1+(c/n)),n); 
        error_array(i) = abs(e - en);
        i = i + 1;
    end

    semilogx(1:power(10,1):power(10,9), error_array);
    xlabel('n','fontsize',16);
    ylabel('Error','fontsize',16);
    set(gca,'FontSize',14);
    
    a = "Computation complete.";
end 