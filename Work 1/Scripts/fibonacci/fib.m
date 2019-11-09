function [old_value] = fib(n)
%
%To compute the fibonacci of n
%we need the two previous fibonacci numbers
%So, i am using two variables - old_value and pre_old_value -
%and the admission that fibonacci(0) = 0
%
old_value = 1; pre_old_value = 0;
if (n == 0) 
    old_value = 0 ;
end
for i = 2:1:n          %We know that Fibonacci, depends on the 2 previous numbers
    current_value = old_value + pre_old_value; %so the current value is equal to the old + pre_old_value
    pre_old_value = old_value;
    old_value = current_value;
end
end