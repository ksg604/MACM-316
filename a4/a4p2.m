

% Case 2: f(x) = -((cos(x^k) / (1 + x^2*k)))

k = 2;
%k = 4;
%k = 8;
f = @(x) -((cos(x.^k) / (1 + x.^(2*k))));

min_xstar = 0;
gamma = ((3 - sqrt(5)) / 2);

triple = [-1, 1/2, 1];

N = 100;
i = 1:N;
error = zeros(N,1);

for j = 1:N
    
    an = triple(1);
    bn = triple(2);
    cn = triple(3);
  
    disp(triple);
    
    %1. Choose a new point x using the formula
    
    if ( (cn - bn) > (bn - an) )
        x = bn + gamma*(cn - bn);
    elseif ( (cn - bn) < (bn - an) )
        x = bn + gamma*(an - bn);
    end
      
    %2. Update the triple using the formula
    
    if (x < bn && f(x) < f(bn))
        triple(3) = bn;
        triple(2) = x;
        
    elseif( x > bn && f(x) < f(bn))
        triple(1) = bn;
        triple(2) = x;
        
    elseif( x < bn && f(x) > f(bn))
        triple(1) = x;
        
    elseif( x > bn && f(x) > f(bn))
        triple(3) = x;
        
    end
    
error(j) = abs(min_xstar - triple(2));
    
end

semilogy(i, error, 'linewidth', 3.0);
xlabel('i (Iteration Number)','fontsize',18);
ylabel('Absolute error','fontsize',18);
title(['Fig 4: Error Vs Iteration Number when k = ' num2str(k)],'fontsize',18);
grid on; 
set(gca,'fontsize',18);








