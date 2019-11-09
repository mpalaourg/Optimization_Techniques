function [value] = golden_section(f,lamda,alpha,beta)
%golden_section
%f: is the function whose the local minimum i want to find
%lamda: the tolerance of the final [a,b]
%
%return:
%value: the middle point of the last interval
%
%The interval repeatedly seperated with ratio equal to gamma=0.168
%and b(k+1) - a(k+1)
%    -------------- = gamma
%      b(k) - a(k)
%
n = 1; gamma = (sqrt(5) -1)/2 ; a = []; b = [];
l = lamda; 
a(n) = alpha; b(n) = beta;
x_1 = a(n) + (1 - gamma)*(b(n) - a(n));
x_2 = a(n) + gamma*(b(n) - a(n));
while b(n)-a(n)>l
    n = n + 1;
    if f(x_1) > f(x_2)
        a(n) = x_1;
        x_1 = x_2;
        b(n) = b(n-1);
        x_2 = a(n) + gamma*(b(n) - a(n));
    else
        a(n) = a(n-1);
        b(n) = x_2;
        x_2 = x_1;
        x_1 = a(n) + (1 - gamma)*(b(n) - a(n));
    end
end
value = (a(n)+b(n))/2;