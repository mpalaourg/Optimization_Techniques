function [value,k,min_x,min_y,point_x,point_y] = steepest_descent_with_projection(e,g,s,x,y)
%steepest_descent_with_projection
%e: is the -final- accuracy of the norm(gradf)
%g: is the constant step of the method, used to find point(k+1)
%s: is the constant step of the method, used to find xbar/ybar
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
%the (x(k),y(k)) it isn't my minumum point, so i calculate
%xbar & ybar, using steepest descent like i haven't any restrictions, with
%a constant step s. Then, i project them into X. Finally, i move with a 
%constant step g, to the direction of (point_k_bar - point_k).
%To prevent the function to run repeatedly, i  define the STEP_MAX.
%
k = 1; point_x = []; point_y = [];
point_x(k) = x; point_y(k) = y;

STEP_MAX = 8000; 

while norm(gradf(point_x(k),point_y(k))) >= e && k < STEP_MAX
%Checking, if my point is feasible. If my point, doesn't lies in X
%i project it into X, so i can use the method, with a feasible point.
    if restrictions(point_x(k),point_y(k)) == false
        [point_x(k),point_y(k)] = projection_X(point_x(k),point_y(k));
    end
    grad = gradf(point_x(k),point_y(k));
    
    xbar = point_x(k) - s * grad(1,1); %%First, we calculate the 
    ybar = point_y(k) - s * grad(2,1); %%x_k - s_k *gradf(x_k)
     
    [xbar,ybar] = projection_X(xbar,ybar); %%project to find xbar_k
    
    point_x(k+1) = point_x(k) + g * (xbar - point_x(k));
    point_y(k+1) = point_y(k) + g * (ybar - point_y(k));

    k = k + 1;
end
min_x = point_x(k);
min_y = point_y(k);
value = f(point_x(k),point_y(k));