function [a,b,k,e,l] = bisection(f,epsilon,lamda)
%bisection
%f: is the function whose the local minimum i want to find
%epsilon: is the distance from the middle point of [a,b]
%lamda: the tolerance of the final [a,b]
%
%return:
%a: a vector of the values from the lower limit of the interval
%b: a vector of the values from the upper limit of the interval
%k: # of iterations
%e: the epsilon for each iteration
%l: the lamda for each iteration
%
%The interval repeatedly seperated at (a+b)/2 -epsilon
%and (a+b)/2 +epsilon, until the final [a,b] is lesser than lamda
%
k = 1; a = []; b= [];
l = lamda;
e = epsilon;
a(k) = 0; b(k) = 6;

while b(k)-a(k)>l
    x_1 = (a(k) + b(k))/2 - e;
    x_2 = (a(k) + b(k))/2 + e;
    k = k + 1;
    if subs(f,x_1) < subs(f,x_2)
        a(k) = a(k-1);
        b(k) = x_2;
    else
        a(k) = x_1;
        b(k) = b(k-1);
    end
end