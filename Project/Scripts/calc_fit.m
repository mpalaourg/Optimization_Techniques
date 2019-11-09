function fitness = calc_fit(genes,size)
%calc_fit
%genes: The solution, whose the score i want to find.
%size: The size of the solution, aka the number of genes.
%return:
%fitness: The "score" of each solution.
%
%The score of each solution, is calculated as the mean square error (mse)
%of the approximation to the real value of f. To make the approximation, i
%am taking 25x25 points from -2 to 2.
value = 0;
for x = linspace(-2,2,25)
    for y = linspace(-2,2,25)
        value = value + (f(x,y) - f_bar(x,y,genes,size))^2;
    end
end
fitness = value/625;