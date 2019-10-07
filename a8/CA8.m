clc
close all;

T= 200;
h = 0.0005;
N = ceil(T/h);
t = 0:h:T; 
tvals = zeros(N+1,1);
tvals(1)= 0;

Q_arr1 = zeros(N+1,1);
Q_arr2 = zeros(N+1,1);
Q_arr3 = zeros(N+1,1);
Q_arr4 = zeros(N+1,1);

P_arr1 = zeros(N+1,1);
P_arr2 = zeros(N+1,1); 
P_arr3 = zeros(N+1,1);
P_arr4 = zeros(N+1,1);


Q_arr1(1) = 0.4; 
Q_arr2(1) = 0;
Q_arr3(1) = 0.4;
Q_arr4(1) = 0;

P_arr1(1) = 0;
P_arr2(1) = sqrt(1.6/0.4); 
P_arr3(1) = 0;
P_arr4(1) = sqrt(1.6/0.4);

A = zeros(N+1,1);
H = zeros(N+1,1);
A2 = zeros(N+1,1);
H2 = zeros(N+1,1);


for i = 1:(N+1)
    
 %Part A
 
 P_arr1(i+1) = P_arr1(i) + h*(-1/((Q_arr1(i).^2) + (Q_arr2(i)^2)).^(3/2))*Q_arr1(i);
 P_arr2(i+1) = P_arr2(i) + h*(-1/((Q_arr1(i).^2) + (Q_arr2(i)^2)).^(3/2))*Q_arr2(i);


 Q_arr1(i+1) =Q_arr1(i)+ h*P_arr1(i);
 Q_arr2(i+1) =Q_arr2(i) + h*P_arr2(i);
 

 %Part B
 
 A(i) = Q_arr1(i)*P_arr2(i) - Q_arr2(i)*P_arr1(i);
 H(i) = (0.5)*(P_arr1(i).^2 + P_arr2(i).^2) - 1/(sqrt(Q_arr1(i).^2 + Q_arr2(i).^2));

 %Part C
 
 Q_arr3(i+1) = Q_arr3(i) + h*P_arr3(i);
 Q_arr4(i+1) = Q_arr4(i) + h*P_arr4(i);

 P_arr3(i+1) = P_arr3(i) - (h/(Q_arr3(i+1).^2+Q_arr4(i+1)^2)^(3/2))*Q_arr3(i+1);
 P_arr4(i+1) = P_arr4(i) - (h/(Q_arr3(i+1).^2+Q_arr4(i+1)^2)^(3/2))*Q_arr4(i+1);

 A2(i) = Q_arr3(i)*P_arr4(i) - Q_arr4(i)*P_arr3(i);
 H2(i) = 1/2*(P_arr3(i).^2 + P_arr4(i).^2) - (1/(sqrt(Q_arr3(i).^2 + Q_arr4(i).^2)));


end


figure(1);
plot(Q_arr1, Q_arr2);
set(gca,'FontSize',14)
title('Figure 1: Euler''s method T = 1000','fontsize',18)
xlabel('q_1(t)','fontsize',18)
ylabel('q_2(t)','fontsize',18)

figure(2);
semilogy(t, A, 'linewidth', 2);
set(gca,'FontSize',14)
title('Figure 2: Conservation of Angular Momentum','fontsize',18)
xlabel('Value of t','fontsize',18)
ylabel('A(t)','fontsize',18)

figure(3);
semilogy(t, H, 'linewidth', 2);
set(gca,'FontSize',16)
title('Figure 3: Conservation of Hamiltonian','fontsize',18)
xlabel('Value of t','fontsize',18)
ylabel(' H(t)','fontsize',18)

figure(4);
plot(Q_arr3, Q_arr4, 'linewidth', 2);
set(gca,'FontSize',14)
title('Figure 4: Symplectic Euler''s method ','fontsize',18)
xlabel('q_1(t)','fontsize',18)
ylabel('q_2(t)','fontsize',18)

figure(5);
semilogy(t, A2,'linewidth', 2);
set(gca,'FontSize',16)
title('Figure 5: Symplectic Conservation for Angular Momentum','fontsize',16)
xlabel('Value of t','fontsize',18)
ylabel('A(t)','fontsize',18)


figure(6);
semilogy(t, H2,'linewidth', 2);
set(gca,'FontSize',16)
title('Figure 6: Symplectic Conservation for Hamiltonian','fontsize',17)
xlabel('Value of t','fontsize',18)
ylabel('H(t)','fontsize',18)
