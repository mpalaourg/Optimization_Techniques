%
%Clear workspace and calculate 
%the contours of f with restrictions
%
clear
size = 100;
xx = linspace(-20, 10, size); 
yy = linspace(-12, 15, size);   
fvalues = zeros(size,size);
count_x = 0;
for i = linspace(-20,10,size)
    count_x = count_x + 1;
    count_y = 1;
    for j = linspace(-12,15,size)
       fvalues(count_x,count_y) = f(i,j);
       count_y = count_y + 1;
    end
end
%
%Plot the pair (x,y) to show the convergence, 
%at the same plot with the contours of f
%

figure('Name','[x,y] for gamma = const = 0.1','NumberTitle','off')
%Convergence of the pair (x,y)
[~,~,~,~,x,y] = steepest_descent_with_projection(0.01,0.1,15,8,3);
plot(x,y,'-or')
hold on
%Contours of f, with the restrictions
contour(xx, yy, fvalues', 15)

%Ploting the rectangle which is definite by the restictions
X = [-20 -20 10 10 -20];
Y = [-12 15 15 -12 -12];
Z = [f(-20,-12) f(-20,15) f(10,15) f(10,-12) f(-20,-12)];
plot3(X, Y, Z);

xlim([-25, 15])
ylim([-20, 23])
xlabel('x') 
ylabel('y') 
legend('[x_k,y_k] convegrence','f contours','the restrictions rectangle')
grid on

figure('Name','[x,y] for gamma = const = 0.01','NumberTitle','off')
%Convergence of the pair (x,y)
[~,~,~,~,x,y] = steepest_descent_with_projection(0.01,0.01,0.1,11,3);
plot(x,y,'-or')
hold on
%Contours of f, with the restrictions
contour(xx, yy, fvalues', 15)

%Ploting the rectangle which is definite by the restrictions
X = [-20 -20 10 10 -20];
Y = [-12 15 15 -12 -12];
Z = [f(-20,-12) f(-20,15) f(10,15) f(10,-12) f(-20,-12)];
plot3(X, Y, Z);

xlim([-25, 15])
ylim([-20, 23])
xlabel('x') 
ylabel('y') 
legend('[x_k,y_k] convegrence','f contours','the restrictions rectangle')
grid on

figure('Name','[x,y] for gamma = const = 0.3','NumberTitle','off')
%Convergence of the pair (x,y)
[~,~,~,~,x,y] = steepest_descent_with_projection(0.02,0.3,1,-5,7);
plot(x,y,'-or')
hold on
%Contours of f, with the restrictions
contour(xx, yy, fvalues', 15)

%Ploting the rectangle which is definite by the restrictions
X = [-20 -20 10 10 -20];
Y = [-12 15 15 -12 -12];
Z = [f(-20,-12) f(-20,15) f(10,15) f(10,-12) f(-20,-12)];
plot3(X, Y, Z);

xlim([-25, 15])
ylim([-20, 23])
xlabel('x') 
ylabel('y') 
legend('[x_k,y_k] convegrence','f contours','the restrictions rectangle')
grid on
