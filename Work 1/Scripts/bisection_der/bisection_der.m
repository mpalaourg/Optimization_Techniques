function [a,b,k,l] = bisection_der(df,lamda)
%bisection_Der
%df: is the derivative of the function whose the local minimum i want to find
%lamda: the tolerance of the final [a,b]
%
%return:
%a: a vector of the values from the lower limit of the interval
%b: a vector of the values from the upper limit of the interval
%k: # of iterations
%l: the lamda for each iteration
%
%The interval repeatedly seperated at (a+b)/2
%until the n-th iteration where the interval:
%    b(0) - a(0)
%? = -----------  is not greater than l
%        2^n
%
k = 1; a = []; b= []; n = 0; 
l = lamda;
a(k) = 0; b(k) = 6;

while( n<log2((b(k) - a(k))/ l))
    n = n +1;
end

for k = 1:n
    x_1 = ( a(k) + b(k) )/2;
    value = subs(df,x_1);
    if value == 0
        return
    elseif value > 0
        a(k+1) = a(k);
        b(k+1) = x_1;
    elseif value < 0
        a(k+1) = x_1;
        b(k+1) = b(k);
    end
end

end