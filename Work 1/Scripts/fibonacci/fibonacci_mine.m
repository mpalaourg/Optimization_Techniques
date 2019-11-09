function [a,b,k,l] = fibonacci_mine(f,lamda)
%fibonacci_mine
%f: is the function whose the local minimum i want to find
%lamda: the tolerance of the final [a,b]
%
%return:
%a: a vector of the values from the lower limit of the interval
%b: a vector of the values from the upper limit of the interval
%k: # of iterations -1
%l: the lamda for each iteration
%
%The interval repeatedly seperated with a ratio of fib(n-1-k)/fib(n-k)
%until k = n-1 . To compute n, we know the the fibonacci of (n+1) MUST
%be greater than (b(1)-a(1))/l
%
l = lamda; n = 0; k = 1; a = []; b = [];
a(k) = 0; b(k) = 6; 
F = (b(k) - a(k))/l; 

while F > fib(n+1)   
    n = n + 1;
end

c = a(k) + (1 -  fib(n-1-k)/fib(n-k) )*(b(k) - a(k));
d = a(k) + ( fib(n-1-k)/fib(n-k) )*(b(k) - a(k));

for k = 1:n-1
    if( subs(f,c)<= subs(f,d))
        a(k+1)=a(k);
        b(k+1) = d;  
        d = c;
        c =  a(k+1) + (1 - fib(n-1-(k+1))/fib(n-(k+1)) )*(b(k+1) - a(k+1));
    else
        b(k+1)=b(k);
        a(k+1) = c; 
        c = d; 
        d =  a(k+1) + (fib(n-1-(k+1))/fib(n-(k+1)) )*(b(k+1) - a(k+1));
    end  
end
end