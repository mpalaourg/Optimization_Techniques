function [value,k,min_x,min_y,point_x,point_y] = quasi_newton(epsilon,g,x,y)
%quasi_newton   ~~ DOESN'T WORK ~~
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
%The idea is to simulate Newton's method,without the calculation of Hessian
%To approximate hessian, we rely on  q_k ~= gradf(x_(k+1)) * p_k
%where q_k = gradf(x_(k+1)) - gradf(x_k) and p_k = x_(k+1) - x_k
%To prevent the function to run repeatedly, i  define the STEP_MAX.
%
k = 1; STEP_MAX = 5000; point_x = []; point_y = [];
point_x(k) = x; point_y(k) = y;
curr_D = 5 * eye(2); p = zeros(2,1); 
while ( norm(gradf(point_x(k),point_y(k))) > epsilon && k <= STEP_MAX)
    if curr_D(1,1) > 0 && det(curr_D) > 0
        d = - curr_D * gradf(point_x(k),point_y(k));
        
        point_x(k+1) = point_x(k) + g * d(1,1);
        point_y(k+1) = point_y(k) + g * d(2,1);
        
        prev_D = curr_D;
        p = [point_x(k+1) - point_x(k) ; point_y(k+1) - point_y(k)];
        q = gradf(point_x(k+1),point_y(k+1)) - gradf(point_x(k),point_y(k)) ;
        curr_D = prev_D + (p * p')/(p' * q) - (prev_D * q * q' * prev_D)/(q' * prev_D * q);
        
        k = k + 1;
    else     
        error('The array of current Direction is not  positive definite at %d iteration', k)
    end
end
min_x = point_x(k);
min_y = point_y(k);
value = f(min_x,min_y);
end