function [value,k,min_x,min_y,point_x,point_y] = newton_mutable_g(epsilon,x,y)
%newton_mutable_g
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
%to the direction of d, with g for step. The value of g, is
%according to a heuristic rule.I initialize g=0.7, in order that 
%at the beginning, i shall make bigger steps. As i move closer to 
%the mininum, i want to make smaller steps, so i reduce g, g =g-0.1g.
%If the value of g is lesser than 0.0008, i triple g, so that i avoid
%oscillations and really small steps.
%The idea is to approach f, with a quadratic function and
%find mininum with one step!
%To prevent the function to run repeatedly, i  define the STEP_MAX.
%                     
k = 1;
STEP_MAX = 5000;
point_x = []; point_y = [];
g =0.7;
e = epsilon; 
point_x(k) = x; point_y(k) = y;
while (norm(gradf(point_x(k), point_y(k))) >= e && k<STEP_MAX)
    hessian = hessianf(point_x(k), point_y(k));    
    if hessian(1,1) >0 && det(hessian) >0
        d = - inv(hessian)*gradf(point_x(k), point_y(k));
        point_x(k+1) = point_x(k) + g*d(1,1);
        point_y(k+1) = point_y(k) + g*d(2,1);
        g = g -0.1*g;
        if g<= 0.0008
            g = g+2*g;
        end
        k = k + 1;
    else
        disp('The hessian is not  positive definite')
        break;
    end
end
value = f(point_x(k),point_y(k));
min_x = point_x(k);
min_y = point_y(k);
end