%
%Plot the # of iterations for fixed
%epsilon= 0.001 and different gamma
%
epsilon = 0.001;
size = 50;
n = zeros(size,1); g = zeros(size,1);
i = 0;
for gamma=linspace(0.1,0.8,size)
    
    i = i + 1;
    [~,n(i),g(i)] = steepest_descent(epsilon,gamma,-2,-1);
    
end

plot(g,n,'*r','LineWidth',1.4)
title('$f$','Interpreter', 'latex')
xlabel('\gamma') 
ylabel('numbers of iterations')