
n = 1024; 
A = zeros(n,n);
gamma = 0.1;


%Create matrix A (Part a (i))
for i = 1:n
    for j = 1:n
        A(i,j) = ((1./n)*(1./(gamma*sqrt(2*pi))))*exp(-(power((i-j),2))/((2*(power(n,2))*(power(gamma,2))))); 
    end
end

%Create true vector f (Part a (ii))
f = zeros(1,n);
x_grid = zeros(1,n);
for i = 1:n
    
    x_grid(i) = i./n;
    
    if x_grid(i) >= 0.1 && x_grid(i) <= 0.2
        f(i) = 0.75;
    elseif x_grid(i) >= 0.5 && x_grid(i) <= 1
        f(i) = 16*(x_grid(i) - 0.75)^2 - 1;
    else
        f(i) = 0;
    end
    
end

%Generate right hand side g = Af (Part a (iii))
g = A*transpose(f);

%Compute numerical solution f_tilda (Part a (iv))
f_tilda = A\g;

figure(1)
hold on; 
plot(x_grid,f_tilda,'linewidth',2.0);
hold off; 
set(gca,'FontSize',18);
xlabel('Value of x','fontsize',18);
ylabel('Value of y','fontsize',18);
title('Figure 1: Recovered function where \gamma = 0.1');

%Part b
condA = cond(A); 
disp(condA);

%Part c Tikhonov regularization
a1 = 0.1;   
a2 = 0.7;   
a3 = 1.5;  

%Define identity matrix,zero vector and g with zero vector
I = eye(n); 
zero_vector = zeros(n,1); 
g_zero = [g ; zero_vector];

%Reconstruct f with Tikhonov regularization for a1,a2,a3
I_a1 = I.*a1;
A_a1 = [A ; I_a1];
f_a1= A_a1\g_zero;

I_a2 = I.*a2;
A_a2 = [A ; I_a2];
f_a2= A_a2\g_zero;

I_a3 = I.*a3;
A_a3 = [A ; I_a3];
f_a3= A_a3\g_zero;

%Plot f and its reconstructions
figure(2);
hold on;
plot(x_grid,f,'linewidth',2.0);
plot(x_grid,f_a1,'linewidth',2.0);
plot(x_grid,f_a2,'linewidth',2.0);
plot(x_grid,f_a3,'linewidth',2.0);
hold off;
set(gca,'FontSize',18);
xlabel('Value of x','fontsize',18);
ylabel('Value of y','fontsize',18);
title('Figure 3: True f Vs reconstructions of f');
legend('f(x)','\alpha = 0.1', '\alpha = 0.7','\alpha =1.5');

%Part d Adjust alpha so that reconstruction matches f as closely as possible
a4 = 0.00000000000003;
I_a4 = I.*a4;
A_a4 = [A ; I_a4];
f_a4= A_a4\g_zero;

figure(3);
hold on;
plot(x_grid,f,'linewidth',2.0);
plot(x_grid,f_a4,'linewidth',2.0);
hold off
set(gca,'FontSize',18);
xlabel('Value of x','fontsize',18);
ylabel('Value of y','fontsize',18);
title('Figure 4: True f Vs Best Reconstruction of f');
legend('f(x)','\alpha = 3.0*10^{-13}');










