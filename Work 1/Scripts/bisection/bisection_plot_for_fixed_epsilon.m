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
%epsilon= 0.001 and different lamda
%
size = 50;
k = zeros(size,1); l = zeros(size,1); epsilon = 0.001; 

i = 0;
for lamda = linspace(0.0021,0.1,size)
    i = i + 1;
    [a,b,k(i),epsilon,l(i)] = bisection(f_1, 0.001, lamda);
end
subplot(3,1,1)
plot(l,2*(k-1),'-r','LineWidth',1.4)
title('$f_1$ = $(x-2)^{3}$ + $(x-3)^{2}$','Interpreter', 'latex')
xlabel('l') 
ylabel('numbers of iterations') 

i = 0;
for lamda = linspace(0.0021,0.1,size)
    i = i + 1;
    [a,b,k(i),epsilon,l(i)] = bisection(f_2, 0.001, lamda);
end
subplot(3,1,2)
plot(l,2*(k-1),'-r','LineWidth',1.4)
title('$f_2$ = $(x-2)^{2}$ + $\sin(x)$','Interpreter', 'latex')
xlabel('l') 
ylabel('numbers of iterations') 

i = 0;
for lamda = linspace(0.0021,0.1,size)
    i = i + 1;
    [a,b,k(i),epsilon,l(i)] = bisection(f_3, epsilon, lamda);
end
subplot(3,1,3)
plot(l,2*(k-1),'-r','LineWidth',1.4)
title('$f_{3}$ = $\sqrt{x+1}$ + ($x^{2}$ - 1)$\ln{(x+1)}$','Interpreter', 'latex')
xlabel('l') 
ylabel('numbers of iterations') 