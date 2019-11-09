function [value,k,min_x,min_y,point_x,point_y] = quasi_newton_mutable_g(epsilon,x,y)
%quasi_newton_mutable_g  ~~ DOESN'T WORK ~~
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
%to the direction of d, with step g.
%The idea is to simulate Newton's method,without the calculation of Hessian
%To approximate hessian, we rely on  q_k ~= gradf(x_(k+1)) * p_k
%where q_k = gradf(x_(k+1)) - gradf(x_k) and p_k = x_(k+1) - x_k
%The value of g, is according to a heuristic rule.
%I initialize g=1, in order that at the beginning, i shall make 
%bigger steps. As i move closer to the mininum, i want to make smaller steps, 
%so i reduce g, g =g-0.1g. If the value of g is lesser than 0.0008, i triple g, 
%so that i avoid oscillations and really small steps.
%To prevent the function to run repeatedly, i  define the STEP_MAX.
%
k = 1; STEP_MAX = 5000; point_x = []; point_y = [];
point_x(k) = x; point_y(k) = y; g = 1;
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
        g = g - 0.1 * g;
        if g<= 0.0008
            g = g+2*g;
        end 
    
    else
        error('The array of current Direction is not  positive definite at %d iteration', k)
    end
end
min_x = point_x(k);
min_y = point_y(k);
value = f(min_x,min_y);
end