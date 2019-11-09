function restriction_flag = restrictions(x,y)
%restrictions
%x: x-coordinate from the point, which i want to check if it lies in X
%y: y-coordinate from the point, which i want to check if it lies in X
%
%return:
%restriction_flag: boolean variable, #true, if (x,y) lie in X, #false otherwise
%
restriction_flag = false;
if x >= -20 && x <= 10
    if y >= -12 && y<=15
        restriction_flag = true;
    end
end