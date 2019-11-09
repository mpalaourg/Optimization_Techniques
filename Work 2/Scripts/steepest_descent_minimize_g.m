function [value,k,min_x,min_y,point_x,point_y] = steepest_descent_minimize_g(epsilon,x,y)
%steepest_descent_minimize_g
%epsilon: is the accuracy of the norm(gradf)
%x: x-coordinate of the initial point
%y: y-coordinate of the initial point
%
%return:
%value: the value of f, for the last pair (x,y)
%k: # of iterations, the max of iterations is 5000 steps
%min_x: x-coordinate of the mininum value
%min_y: y-coordinate of the mininum value
%point_x: a vector of the values from the x-coordinate
%point_y: a vector of the values from the y-coordinate
%
%As long as the norm of gradf is greater than epsilon
%the (x(k),y(k)) it isn't my minumum point, so i move
%to the direction of d, with the minimized value of g for step.
%For the minimization of h(g) = f(point_x(k) + g*d,point_y(k) + g*d)
%i am using the golden_section method, from the previous assignment
%To prevent the function to run repeatedly, i  define the STEP_MAX.
%

k = 1; 
STEP_MAX = 5000;
point_x = []; point_y = [];
e = epsilon; l = (10*e)/4; % I want l>epsilon/2 , so i define l=2.5*epsilon
alpha = 0; beta = 5; % the interval, where i look for minimum g. 
point_x(k) = x; point_y(k) = y;
while (norm(gradf(point_x(k), point_y(k))) >= e && k<STEP_MAX)
    d = - gradf(point_x(k), point_y(k));
    h = @(g)f(point_x(k) + g*d(1,1),point_y(k) + g*d(2,1));
    g = golden_section(h,l,alpha,beta);
    point_x(k+1) = point_x(k) + g*d(1,1);
    point_y(k+1) = point_y(k) + g*d(2,1);
    k = k + 1;
end
value = f(point_x(k),point_y(k));
min_x = point_x(k);
min_y = point_y(k);
end