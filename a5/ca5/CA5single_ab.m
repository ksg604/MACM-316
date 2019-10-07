%Figures for part A, B and C

err_grid = (linspace(-1,1,10000))'; % Equally-spaced grid of 10000 nodes to compute error on
tol = 1e-10; % tolerance used to determined largest value of n

a = 0.2; b = 0.2; % Set values of a,b
f = @(x) 1./((x-a).^2+b.^2); % Define f(x)

f_grid = f(err_grid); % Evaluate f on the error grid
errvals = []; % Initialize an error vector
err = 1; % set the error initially to 1
n = 0; % initialize n

while err > tol
    n = n+1;
    
    % compute points
    x = (linspace(0,1,n+1))';
    x = cos(pi*x);
    
    % compute weights
    w = (-1).^((0:n)');
    w(1) = 1/2; w(n+1) = w(n+1)/2;
    
    y = f(x); % Evaluate f at the nodes
    p = baryinterp(x,w,y,err_grid); % Compute P(x) on the error grid
    err = max(abs(p - f_grid)); % Compute error
    errvals = [errvals err]; % Update error vector
    
end

figure(1);
semilogy(1:n,errvals,'*');
set(gca,'FontSize',18);
xlabel('Value of n','fontsize',20);
ylabel('Error','fontsize',20);
title('Figure 1: Error vs n where a = 0.2, b = 0.2','fontsize',18);
grid on;

xvals = 1:n;

poly = polyval(polyfit(xvals,log(errvals),1), xvals);

hold on;
semilogy(1:n,exp(poly),'linewidth',2);

g = exp(poly);
p2 = g(1)/g(2);
disp(p2);

