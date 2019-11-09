function value = f_bar(xbar,ybar,genes,size)
%f_bar
%xbar: the x-coordinate of the point, where i want to calcalute fbar
%ybar: the y-coordinate of the point, where i want to calcalute fbar
%genes: the chromosome, so i can define the gaussians of the approximation
%size: the length of the chromosome
%return:
%value: the value of the approximation at (xbar,ybar)
%
%To calculate the approximation of f, i will add the contribution of each
%gaussian to find the final value.
%
value = 0;
for i = 1:5:size
    A = genes(i);
    c1 = genes(i+1);
    c2 = genes(i+2);
    s1 = genes(i+3);
    s2 = genes(i+4);
    value = value + A * exp(-((xbar-c1)^2/(2*s1^2) + (ybar-c2)^2/(2*s2^2)));
end