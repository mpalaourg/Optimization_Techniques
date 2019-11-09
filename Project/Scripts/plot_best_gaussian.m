function [] = plot_best_gaussian(genes,gsize,error)
%plot_best_gaussian
%genes: The best chromosome, which i'll use to plot the approximation of f
%gsize: The length of genes.
%error: The error of each generation, which correspond to the best solution
%


size = 50;

xx = linspace(-2, 2, size); 
yy = linspace(-2, 2, size); 

%
%The plot of the approximation of f and the contours of the approximation
%

f_aprox = zeros(size,size);
count_x = 1;
for i = linspace(-2,2,size)
    count_y = 1;
    for j = linspace(-2,2,size)
        f_aprox(count_x,count_y) = f_bar(i,j,genes,gsize);
        count_y = count_y + 1;
    end
    count_x = count_x + 1;
end
figure('Name','Contours of f approach','NumberTitle','off')
contour(xx, yy, f_aprox, 15);

figure('Name','f approach plot','NumberTitle','off')
surf(xx,yy,f_aprox)

%
%The plot of f and the contours of f
%

fvalues = zeros(size,size);
count_x = 1;
    for i = linspace(-2,2,size)
        count_y = 1;
        for j = linspace(-2,2,size)
            fvalues(count_x,count_y) = f(i,j);
            count_y = count_y + 1;
        end
        count_x = count_x + 1;
    end
figure('Name','f plot','NumberTitle','off')
surf(xx,yy,fvalues)

figure('Name','Contours of f','NumberTitle','off')
contour(xx, yy, fvalues, 15)

%
%The error of the approximation (2d and 3d representation ) 
%

figure('Name','Error','NumberTitle','off')
plot(error)
err_values = fvalues - f_aprox;

figure('Name','Error 3d','NumberTitle','off')
surf(xx,yy,err_values);
