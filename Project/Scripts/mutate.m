function mut_pop = mutate(individual,gsize)
%mutate
%individual: The solution whose the genes i want to mutate
%gsize: The size of the solution, aka the number of the genes
%return:
%mut_pop: The individual, with one of his genes changed.
%
%For one solution, which was picked at random from the whole population
%we choose -again- at random one gene, to mutate. The mutation method, is
%to swap the current value of the gene, with one random value within limits
%for each parameter.
mod_index = round (1 + (gsize - 1)*rand);
switch(mod(mod_index,5))
    case 1
        individual{1,1}(mod_index) = -1 + 2 * rand; %magnitude of gauss; [-1,1]
    case 2
        individual{1,1}(mod_index) = -4 + 8*rand; %center1 [-4,4]
    case 3
        individual{1,1}(mod_index) = -4 + 8*rand; %center2 [-4,4]
    case 4
        individual{1,1}(mod_index) = 0.2 + 1.1 * rand; %sigma1 [0.1,3]
    case 0
        individual{1,1}(mod_index) = 0.2 + 1.1 * rand; %sigma2 [0.1,3]
end
%good results for [-2,2] magnitude && [0.1 , 1.5] sigma
mut_pop = individual{1,1};