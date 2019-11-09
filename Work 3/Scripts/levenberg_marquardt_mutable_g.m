function [value,k,min_x,min_y,point_x,point_y] = levenberg_marquardt_mutable_g(epsilon,x,y)
%levenberg_marquardt_mutable_g
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
%The idea is to resolve the problem of Newton method
%where the hessian wasn't positive definite. So we add to hessian
%the " m*eye(2) " term, to demand (by controlling m) a positive definite
%direction array. The value of g, is according to a heuristic rule.
%I initialize g=1.5, in order that at the beginning, i shall make 
%bigger steps. As i move closer to the mininum, i want to make smaller steps, 
%so i reduce g, g =g-0.1g. If the value of g is lesser than 0.0008, i triple g, 
%so that i avoid oscillations and really small steps.
%To prevent the function to run repeatedly, i  define the STEP_MAX.
%
k = 1; STEP_MAX = 5000; g = 1.5;
point_x = []; point_y = [];
point_x(k) = x; point_y(k) = y;
while ( norm(gradf(point_x(k),point_y(k))) > epsilon && k <= STEP_MAX)
    hessian = hessianf(point_x(k),point_y(k));
    eigen = eig(hessian);
    m = abs(max(eigen));
%chol(array) return p = 0  for a positive definite array, p>0 otherwise    
    [~,p] = chol(hessian + m * eye(2));
    while p>0 % find that m1 that is greater than m , so the array is positive definite
        m = m + 0.1;
        [~,p] = chol(hessian + m * eye(2));
    end
    d = - inv(hessian + m * eye(2)) * gradf(point_x(k),point_y(k));
%Checking if the criteria was fullfilled, display error message otherwise    
    if criteria_testing(g,d,k,point_x,point_y);
        point_x(k+1) = point_x(k) + g * d(1,1);
        point_y(k+1) = point_y(k) + g * d(2,1);
    else
        error('Error! At %d iteration, the recuirements of the criteria was not fulfilled',k)
    end
    g = g - 0.1 * g;
    if g<= 0.0008
        g = g+2*g;
    end 
        
    k = k + 1;
end
min_x = point_x(k);
min_y = point_y(k);
value = f(min_x,min_y);
end