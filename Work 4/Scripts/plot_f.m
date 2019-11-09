%
%The plot of f and the contours of f
%
size = 100;

xx = linspace(-20, 20, size); 
yy = linspace(-20, 20, size); 

fvalues = zeros(size,size);
count_x = 0;
for i = linspace(-20,20,size)
    count_x = count_x + 1;
    count_y = 1;
    for j = linspace(-20,20,size)
       fvalues(count_x,count_y) = f(i,j);
       count_y = count_y + 1;
    end
end
figure('Name','f plot','NumberTitle','off')
surf(fvalues)
%max(max(fvalues))
%min(min(fvalues))

figure('Name','Contours of f','NumberTitle','off')
contour(xx, yy, fvalues, 15)