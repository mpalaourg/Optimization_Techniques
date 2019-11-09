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
figure('Name','[x,y] for gamma = const = 0.1','NumberTitle','off')
[~,~,~,~,x,y] = steepest_descent(0.1,8,3);
plot(x,y,'-or')
hold on
contour(xx, yy, fvalues)
xlabel('x') 
ylabel('y') 
grid on

figure('Name','[x,y] for gamma = const = 1','NumberTitle','off')
[~,~,~,~,x,y] = steepest_descent(1,8,3);
plot(x,y,'-or')
hold on
contour(xx, yy, fvalues)
xlabel('x') 
ylabel('y') 
grid on

figure('Name','[x,y] for gamma = const = 2','NumberTitle','off')
[~,~,~,~,x,y] = steepest_descent(2,8,3);
plot(x,y,'-or')
hold on
contour(xx, yy, fvalues)
xlabel('x') 
ylabel('y') 
grid on
%{
figure('Name','[x,y] for gamma const = 10','NumberTitle','off')
[~,~,~,~,x,y] = steepest_descent(10,-1,-1);
plot(x,y,'-or')
hold on
contour(xx, yy, fvalues)
%xlim([-2, 0])
%ylim([-2, 0])
xlabel('x') 
ylabel('y') 
grid on
%}