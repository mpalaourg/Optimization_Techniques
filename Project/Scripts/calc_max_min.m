function [maxi,mini] = calc_max_min()
%calc_max_min
%Takes none input arguments
%return:
%maxi: Maximum value of f
%mini: Mininum value of f
%
%Calculating the maximum and the mininum value of f
%using points to aproximate the real max and min respectively.
%Then those values, are used to define the limits of the magnitude
%of the gaussians.
%
size = 30;
fvalues = zeros(size,size);
count_x = 1;
for x = linspace(-2,2,size)
    count_y = 1;
    for y = linspace(-2,2,size)
        fvalues(count_x,count_y) = f(x,y);
    count_y = count_y + 1;
    end
    count_x = count_x + 1;
end
maxi = max(max(fvalues));
mini = min(min(fvalues));
   