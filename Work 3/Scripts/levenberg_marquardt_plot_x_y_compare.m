%
%Clear workspace
%
clear 

%
%Plot the pair (x,y) in every step k, of the convergence, 
%for the three different attitudes of gamma
%
figure('Name','(x,y) convergence for f','NumberTitle','off')
subplot(3,1,1)
[~,k,~,~,x,y] = levenberg_marquardt(0.001,1.4,-2,-1);
for i=0:1:k-1
    plot(i,x(i+1),'*r')
    hold on
    plot(i,y(i+1),'ob')
end
xlim([0 17])
xlabel('numbers of iterations for \gamma const') 
ylabel('[x_k,y_k]')
legend('x_k','y_k') 

subplot(3,1,2)
[~,k,~,~,x,y] = levenberg_marquardt_minimize_g(0.001,-2,-1);
for i=0:1:k-1
    plot(i,x(i+1),'*r')
    hold on
    plot(i,y(i+1),'ob')
end
xlim([0 17])
xlabel('numbers of iterations for minimize \gamma') 
ylabel('[x_k,y_k]') 
legend('x_k','y_k')
subplot(3,1,3)
[~,k,~,~,x,y] = levenberg_marquardt_mutable_g(0.001,-2,-1);
for i=0:1:k-1
    plot(i,x(i+1),'*r')
    hold on
    plot(i,y(i+1),'ob')
end
xlim([0 17])
xlabel('numbers of iterations for mutable \gamma') 
ylabel('[x_k,y_k]')
legend('x_k','y_k')