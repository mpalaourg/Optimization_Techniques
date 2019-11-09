%
%The plot of f and the contours of f
%
size = 100;
fvalues =zeros(size,size);
count_x = 0;

xx = linspace(-10, 10, size);
yy = linspace(-10, 10, size);
for i = linspace(-10,10,size)
    count_x = count_x + 1;
    count_y = 1;
    for j = linspace(-10,10,size)
       fvalues(count_x,count_y) = f(i,j);
       count_y = count_y + 1;
    end
end

figure('Name','f plot','NumberTitle','off')
surf(fvalues)
max(max(fvalues));
min(min(fvalues));

figure('Name','Contours of f','NumberTitle','off')
contour(xx, yy, fvalues)
xlim([-4, 4])
ylim([-4, 4])