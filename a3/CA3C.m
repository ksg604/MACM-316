
load('CA3matrix.mat');
k = 5:5:150;
expA = expm(A);
errors = zeros(length(k),1);

for i = 1:length(k)
    I_mat = eye(500,500);
    expAk = zeros(500,500);
    
    for j = 1:k(i)
        expAk = expAk + I_mat;
        I_mat = (A*I_mat)/j;
    end
    errors(i) = norm(expA - expAk)/ norm(expA);
        
end

semilogy(k,errors,'linewidth',3.0)
xlabel('Value of k','fontsize',18);
ylabel('Error','fontsize',18);
title('Error Vs k');
grid on;
set(gca,'fontsize',18);


