%
%Clear workspace and define the functions
%
clear 
syms x;
f_1 = (x-2)^3 + (x-3)^2;
f_2 = (x-2)^2 +sin(x);
f_3 = sqrt(x+1) + (x^2 -2)*log(x+1);

%
%Plot the interval [a,b] in every step k, of the seperation, 
%for some values of lamda
%
epsilon = 0.001;

figure('Name','[a,b] reduction for f_1','NumberTitle','off')
subplot(3,1,1)
[a,b,k] = bisection(f_1,epsilon,0.0025);

for i=0:1:k-1
    plot(i,a(i+1),'*r')
    hold on
    plot(i,b(i+1),'ob')
end
xlim([0 16])
title('$f_1$ = $(x-2)^{3}$ + $(x-3)^{2}$','Interpreter', 'latex')
xlabel('numbers of iterations @l=0.0025') 
ylabel('[a_k,b_k]') 

subplot(3,1,2)
[a,b,k] = bisection(f_1,epsilon,0.02);

for i=0:1:k-1
    plot(i,a(i+1),'*r')
    hold on
    plot(i,b(i+1),'ob')
end
xlim([0 16])
xlabel('numbers of iterations @l=0.02') 
ylabel('[a_k,b_k]') 

subplot(3,1,3)  
[a,b,k] = bisection(f_1,epsilon,0.05);
for i=0:1:k-1
    plot(i,a(i+1),'*r')
    hold on
    plot(i,b(i+1),'ob')
end
xlim([0 16])
xlabel('numbers of iterations @l=0.05') 
ylabel('[a_k,b_k]') 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure('Name','[a,b] reduction for f_2','NumberTitle','off')
subplot(3,1,1)
[a,b,k] = bisection(f_2,epsilon,0.0025);
for i=0:1:k-1
    plot(i,a(i+1),'*r')
    hold on
    plot(i,b(i+1),'ob')
end
xlim([0 16])
title('$f_2$ = $(x-2)^{2}$ + $\sin(x)$','Interpreter', 'latex')
xlabel('numbers of iterations @l=0.0025') 
ylabel('[a_k,b_k]') 

subplot(3,1,2)
[a,b,k] = bisection(f_2,epsilon,0.02);
for i=0:1:k-1
    plot(i,a(i+1),'*r')
    hold on
    plot(i,b(i+1),'ob')
end
xlim([0 16])
xlabel('numbers of iterations @l=0.02') 
ylabel('[a_k,b_k]') 

subplot(3,1,3)  
[a,b,k] = bisection(f_2,epsilon,0.05);
for i=0:1:k-1
    plot(i,a(i+1),'*r')
    hold on
    plot(i,b(i+1),'ob')
end
xlim([0 16])
xlabel('numbers of iterations @l=0.05') 
ylabel('[a_k,b_k]') 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure('Name','[a,b] reduction for f_3','NumberTitle','off')
subplot(3,1,1)
[a,b,k] = bisection(f_3,epsilon,0.0025);
for i=0:1:k-1
    plot(i,a(i+1),'*r')
    hold on
    plot(i,b(i+1),'ob')
end
xlim([0 16])
title('$f_{3}$ = $\sqrt{x+1}$ + ($x^{2}$ - 1)$\ln{(x+1)}$','Interpreter', 'latex')
xlabel('numbers of iterations @l=0.0025') 
ylabel('[a_k,b_k]') 

subplot(3,1,2)
[a,b,k] = bisection(f_3,epsilon,0.02);
for i=0:1:k-1
    plot(i,a(i+1),'*r')
    hold on
    plot(i,b(i+1),'ob')
end
xlim([0 16])
xlabel('numbers of iterations @l=0.02') 
ylabel('[a_k,b_k]') 

subplot(3,1,3)  
[a,b,k] = bisection(f_3,epsilon,0.05);
for i=0:1:k-1
    plot(i,a(i+1),'*r')
    hold on
    plot(i,b(i+1),'ob')
end
xlim([0 16])
xlabel('numbers of iterations @l=0.05') 
ylabel('[a_k,b_k]') 