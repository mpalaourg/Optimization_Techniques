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
figure('Name','[a,b] reduction for f_1','NumberTitle','off')
subplot(3,1,1)
df = diff(f_1);
[a,b,k] = bisection_der(df,0.02);
for i=0:1:k
    plot(i,a(i+1),'*r')
    hold on
    plot(i,b(i+1),'ob')
end
xlim([0 10])
title('$f_1$ = $(x-2)^{3}$ + $(x-3)^{2}$','Interpreter', 'latex')
xlabel('numbers of iterations @l=0.02') 
ylabel('[a,b]') 

subplot(3,1,2)
[a,b,k] = bisection_der(df,0.05);
for i=0:1:k
    plot(i,a(i+1),'*r')
    hold on
    plot(i,b(i+1),'ob')
end
xlim([0 10])
xlabel('numbers of iterations @l=0.05') 
ylabel('[a,b]') 

subplot(3,1,3)  
[a,b,k] = bisection_der(df,0.1);
for i=0:1:k
    plot(i,a(i+1),'*r')
    hold on
    plot(i,b(i+1),'ob')
end
xlim([0 10])
xlabel('numbers of iterations @l=0.1') 
ylabel('[a,b]') 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure('Name','[a,b] reduction for f_2','NumberTitle','off')
subplot(3,1,1)
df = diff(f_2);
[a,b,k] = bisection_der(df,0.02);
for i=0:1:k
    plot(i,a(i+1),'*r')
    hold on
    plot(i,b(i+1),'ob')
end
xlim([0 10])
title('$f_2$ = $(x-2)^{2}$ + $\sin(x)$','Interpreter', 'latex')
xlabel('numbers of iterations @l=0.02') 
ylabel('[a,b]') 

subplot(3,1,2)
[a,b,k] = bisection_der(df,0.05);
for i=0:1:k
    plot(i,a(i+1),'*r')
    hold on
    plot(i,b(i+1),'ob')
end
xlim([0 10])
xlabel('numbers of iterations @l=0.05') 
ylabel('[a,b]') 

subplot(3,1,3)  
[a,b,k] = bisection_der(df,0.1);
for i=0:1:k
    plot(i,a(i+1),'*r')
    hold on
    plot(i,b(i+1),'ob')
end
xlim([0 10])
xlabel('numbers of iterations @l=0.1') 
ylabel('[a,b]') 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','[a,b] reduction for f_3','NumberTitle','off')
subplot(3,1,1)
df = diff(f_3);
[a,b,k] = bisection_der(df,0.02);
for i=0:1:k
    plot(i,a(i+1),'*r')
    hold on
    plot(i,b(i+1),'ob')
end
xlim([0 10])
title('$f_{3}$ = $\sqrt{x+1}$ + ($x^{2}$ - 1)$\ln{(x+1)}$','Interpreter', 'latex')
xlabel('numbers of iterations @l=0.02') 
ylabel('[a,b]') 

subplot(3,1,2)
[a,b,k] = bisection_der(df,0.05);
for i=0:1:k
    plot(i,a(i+1),'*r')
    hold on
    plot(i,b(i+1),'ob')
end
xlim([0 10])
xlabel('numbers of iterations @l=0.05') 
ylabel('[a,b]') 

subplot(3,1,3)  
[a,b,k] = bisection_der(df,0.1);
for i=0:1:k
    plot(i,a(i+1),'*r')
    hold on
    plot(i,b(i+1),'ob')
end
xlim([0 10])
xlabel('numbers of iterations @l=0.1') 
ylabel('[a,b]') 
