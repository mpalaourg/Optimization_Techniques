function [value,k,min_x,min_y,point_x,point_y] = conjugate(epsilon,g,x,y)
%conjugate
%epsilon: is the accuracy of the norm(gradf)
%g: is the constant step of the method
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
%to the direction of d, for a constant step g.
%The idea is to reduce the number of calculations of 2nd order derivatives  
%-for example in Newton's method we had n^2 calculations-.
%At the first iteration the method works like "steepest descent method"
%From 2nd iteration and on, we produce the conjugate directions
%and the method for a quadratic function guarantee convergence, with maximum
%n steps.  
%To prevent the function to run repeatedly, i  define the STEP_MAX.
%
k = 1; STEP_MAX = 5000; point_x = []; point_y = [];
point_x(k) = x; point_y(k) = y; 
curr_direction = - gradf(point_x(k),point_y(k));

while ( norm(gradf(point_x(k),point_y(k))) > epsilon && k <= STEP_MAX)
    
    point_x(k+1) = point_x(k) + g * curr_direction(1,1);
    point_y(k+1) = point_y(k) + g * curr_direction(2,1);
    prev_direction = curr_direction;
    k = k + 1;
%f is not quadratic, so we use the second formula for b    
    num = gradf(point_x(k),point_y(k))' * ( gradf(point_x(k),point_y(k)) - gradf(point_x(k-1),point_y(k-1)));
    den = gradf(point_x(k-1),point_y(k-1))' * gradf(point_x(k-1),point_y(k-1));
    b = num / den;
    curr_direction = -gradf(point_x(k),point_y(k)) + b * prev_direction;
end
min_x = point_x(k);
min_y = point_y(k);
value = f(min_x,min_y);
end