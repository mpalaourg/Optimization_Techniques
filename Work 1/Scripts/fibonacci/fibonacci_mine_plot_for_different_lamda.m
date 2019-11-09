%
%Clear workspace and define the functions
%
clear 
syms x;

f_1 = (x-2)^3 + (x-3)^2;
f_2 = (x-2)^2 +sin(x);
f_3 = sqrt(x+1) + (x^2 -2)*log(x+1);
%
%Plot the # of calls of the function f 
%for different values of lamda
%
size = 50;
k = zeros(size,1); l = zeros(size,1); 

i = 0;
for lamda=linspace(0.002,0.1,size) 
    i = i + 1;
    [a,b,k(i),l(i)] = fibonacci_mine(f_1,lamda);
end
subplot(3,1,1)
plot(l,k,'-r','LineWidth',1.4)
title('$f_1$ = $(x-2)^{3}$ + $(x-3)^{2}$','Interpreter', 'latex')
xlabel('l') 
ylabel('numbers of iterations') 

i = 0;
for lamda=linspace(0.002,0.1,size)
    i = i + 1;
    [a,b,k(i),l(i)] = fibonacci_mine(f_2,lamda);
end
subplot(3,1,2)
plot(l,k,'-r','LineWidth',1.4)
title('$f_2$ = $(x-2)^{2}$ + $\sin(x)$','Interpreter', 'latex')
xlabel('l') 
ylabel('numbers of iterations') 

i = 0;
for lamda=linspace(0.002,0.1,size)
    i = i + 1;
    [a,b,k(i),l(i)] = fibonacci_mine(f_3,lamda);
end
subplot(3,1,3)
plot(l,k,'-r','LineWidth',1.4)
title('$f_{3}$ = $\sqrt{x+1}$ + ($x^{2}$ - 1)$\ln{(x+1)}$','Interpreter', 'latex')
xlabel('l') 
ylabel('numbers of iterations') 