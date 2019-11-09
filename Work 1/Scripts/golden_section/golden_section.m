function [a,b,n,l] = golden_section(f,lamda)
%golden_section
%f: is the function whose the local minimum i want to find
%lamda: the tolerance of the final [a,b]
%
%return:
%a: a vector of the values from the lower limit of the interval
%b: a vector of the values from the upper limit of the interval
%n: # of iterations
%l: the lamda for each iteration
%
%The interval repeatedly seperated with ratio equal to g=0.168
%and b(k+1) - a(k+1)
%    -------------- = g
%      b(k) - a(k)
%
n = 1; g = 0.618; a = []; b = [];
l = lamda;
a(n) = 0; b(n) = 6;
x_1 = a(n) + (1 - g)*(b(n) - a(n));
x_2 = a(n) + g*(b(n) - a(n));
while b(n)-a(n)>l
    n = n + 1;
    if subs(f,x_1) > subs(f,x_2)
        a(n) = x_1;
        x_1 = x_2;
        b(n) = b(n-1);
        x_2 = a(n) + g*(b(n) - a(n));
    else
        a(n) = a(n-1);
        b(n) = x_2;
        x_2 = x_1;
        x_1 = a(n) + (1 - g)*(b(n) - a(n));
    end
end