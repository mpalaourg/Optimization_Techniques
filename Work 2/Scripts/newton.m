function [value,k,min_x,min_y,point_x,point_y] = newton(epsilon,g,x,y)
%newton
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
%The idea is to approach f, with a quadratic function and
%find mininum with one step!
%To prevent the function to run repeatedly, i  define the STEP_MAX.
%
k = 1;
STEP_MAX = 5000;
point_x = []; point_y = [];
e = epsilon;
point_x(k) = x; point_y(k) = y;
while (norm(gradf(point_x(k), point_y(k))) >= e && k<STEP_MAX)
    hessian = hessianf(point_x(k), point_y(k));    
    if hessian(1,1) >0 && det(hessian) >0
        d = - inv(hessian)*gradf(point_x(k), point_y(k));
        point_x(k+1) = point_x(k) + g*d(1,1);
        point_y(k+1) = point_y(k) + g*d(2,1);
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