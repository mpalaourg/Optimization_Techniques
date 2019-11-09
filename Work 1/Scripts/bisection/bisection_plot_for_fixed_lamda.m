%
%Clear workspace and define the functions
%
clear 
syms x;

f_1 = (x-2)^3 + (x-3)^2;
f_2 = (x-2)^2 +sin(x);
f_3 = sqrt(x+1) + (x^2 -2)*log(x+1);
%
%Plot the # of calls of the function f for fixed
%lamda= 0.01 and different epsilon
%
size = 50;
k = zeros(size,1); e = zeros(size,1); lamda = 0.01;

i = 0;
for epsilon = linspace(0.0001,0.0049,size)
    i = i + 1;
    [a,b,k(i),e(i),lambda] = bisection(f_1, epsilon, 0.01);
end
subplot(3,1,1)
plot(e,2*(k-1),'-r','LineWidth',1.4)
title('$f_1$ = $(x-2)^{3}$ + $(x-3)^{2}$','Interpreter', 'latex')
xlabel('\epsilon') 
ylabel('numbers of iterations') 

i = 0;
for epsilon = linspace(0.0001,0.0049,size)
    i = i + 1;
    [a,b,k(i),e(i)] = bisection(f_2, epsilon, 0.01);
end
subplot(3,1,2)
plot(e,2*(k-1),'-r','LineWidth',1.4)
title('$f_2$ = $(x-2)^{2}$ + $\sin(x)$','Interpreter', 'latex')
xlabel('\epsilon') 
ylabel('numbers of iterations') 

i = 0;
for epsilon = linspace(0.0001,0.0049,size)
    i = i + 1;
    [a,b,k(i),e(i)] = bisection(f_3, epsilon, 0.01);
end
subplot(3,1,3)
plot(e,2*(k-1),'-r','LineWidth',1.4)
title('$f_{3}$ = $\sqrt{x+1}$ + ($x^{2}$ - 1)$\ln{(x+1)}$','Interpreter', 'latex')
xlabel('\epsilon') 
ylabel('numbers of iterations') 