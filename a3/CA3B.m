%Kevin San Gabriel
%301342241
%MACM 316 Computing Assignment 3 Part b

%Figure 3

load('CA3matrix.mat');
k = 5:5:150;
times = zeros(length(k),1);

for i = 1:length(k)
    tic;
    I_mat = eye(500,500);
    expAk = zeros(500,500);
    
    for j = 1:k(i)
        expAk = expAk + I_mat;
        I_mat = (A*I_mat) / j;
    end
    times(i) = toc;
end
    

plot(k,times,'linewidth',3.0)
xlabel('Value of k','fontsize',18);
ylabel('Computational Time','fontsize',18);
title('Computational Time Vs k');
grid on;
set(gca,'fontsize',18);





