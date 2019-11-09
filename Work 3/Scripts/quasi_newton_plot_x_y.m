%
%Clear workspace and calculate 
%the contours of f
%
clear
size = 100;
xx = linspace(-10, 10, size);
yy = linspace(-10, 10, size);
fvalues =zeros(size,size);
count_x = 0;
for i = linspace(-10,10,size)
    count_x = count_x + 1;
    count_y = 1;
    for j = linspace(-10,10,size)
       fvalues(count_x,count_y) = f(i,j);
       count_y = count_y + 1;
    end
end
%
%Plot the pair (x,y) to show the convergence, 
%at the same plot with the contours of f
%

figure('Name','(x,y) for minimize gamma','NumberTitle','off')
subplot(2,1,1)
[~,~,~,~,x,y] = quasi_newton_minimize_g(0.001,-2,-1);
plot(x,y,'-or')
hold on
contour(xx, yy, fvalues)
xlim([-2, 0])
ylim([-2, 0])
xlabel('x') 
ylabel('y') 
grid on

subplot(2,1,2)
[~,k,~,~,x,y] = quasi_newton_minimize_g(0.001,-2,-1);
for i=0:1:k-1
    plot(i,x(i+1),'*r')
    hold on
    plot(i,y(i+1),'ob')
end
xlim([0 6])
xlabel('numbers of iterations for minimize \gamma') 
ylabel('[x_k,y_k]') 
legend('x_k','y_k')