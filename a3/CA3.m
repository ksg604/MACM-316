%Kevin San Gabriel
%301342241
%MACM 316 Computing Assignment 3 Part a

%Figure 1
%CA3matrix will be matrix A
load("CA3matrix.mat");


%Case 1: k = 50
I_mat = eye(500,500);
expAk = zeros(500,500);
expAk = expAk + I_mat;

k = 50;

for i = 1:k
    expAk = expAk + (A^i)/factorial(i);
end

imagesc(real(expAk));
colormap gray;
title('Approximation of the exponential of matrix A where k = 50', 'fontsize', 18);
set(gca,'fontsize',14);



%Figure 2
%Case 2: k = 150
expAk = zeros(500,500);
expAk = expAk + I_mat;

k = 150;

for i = 1:150
    expAk = expAk + (A^i)/factorial(i);
end

imagesc(real(expAk));
colormap gray;
title('Approximation of the exponential of matrix A where k = 150', 'fontsize', 18);
set(gca,'fontsize',14);

