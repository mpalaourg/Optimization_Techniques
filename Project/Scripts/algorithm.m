function [best_cand,err,generation] = algorithm()
clear

num_of_gaussians = 15; num_of_population = 50; 
chance_of_mutation = 9; 
generation = 1; MAX_GENERATIONS = 10000;
population = cell(num_of_population,1);
size = num_of_gaussians * 5;  
genes = zeros(1,size);
dlim = -4; ulim = 4; 
num_best = 15; num_rn = 5; 
err = inf(1,MAX_GENERATIONS);
best = cell(MAX_GENERATIONS,1);

%Calculate the approximate max and min value, of the function f.
[maxi, mini] = calc_max_min;

% First Generation - Random values
for j = 1:num_of_population
    for i = 1:5:size
        genes(i) = mini + (maxi - mini) * rand; %magnitude of gauss (mini,maxi)
        genes(i+1) = dlim + (ulim - dlim)*rand; %center1
        genes(i+2) = dlim + (ulim - dlim)*rand; %center2
        genes(i+3) = 0.2 + (1.3 - 0.2) * rand; %sigma1 
        genes(i+4) = 0.2 + (1.3 - 0.2) * rand; %sigma2
    end
    population{j}{1,1} = genes; 
    population{j}{1,2} = calc_fit(genes,size);
end
%My population is a cell-array, of 50 ~ (1,2) cell arrays (genes, fitness)

% Sorting for the 1st generation, the key is the fitness of each cell
population = Quicksort(population,1,length(population));

best{generation} = population{1}{1,1};
err(generation) = population{1}{1,2}; 
prev_error = population{1}{1,2};

while ( prev_error >=0.005 && generation <= MAX_GENERATIONS)
%select the 20 best genes, population stay the same for the 1st 20 elements

%select 10 random genes!
   for i = 1:num_rn
       population{num_best+i}{1,1} = population{round(num_best+1 + (num_of_population -(num_best+1))*rand)}{1,1};
   end
   for k = (num_rn+num_best+1):num_of_population
       %Select 2 random genes
       fittest_gene = population{round(1 + (num_best - 1)*rand)};
       second_fittest = population{round(1 + (num_best - 1)*rand)};
       for i = 1:size
           population{k}{1,1}(i) = (fittest_gene{1,1}(i) + second_fittest{1,1}(i))/2;
       end
   end
%Mutate some of the  individuals
for i = 1:num_of_population
    if rand * 100 < chance_of_mutation   
       population{i}{1,1} = mutate(population{i},size);
    end
end
%Calculate again the fitness of each gene
for j = 1:num_of_population
    population{j}{1,2} = calc_fit(population{j}{1,1},size);
end
% Sort the cell-array, the key is the fitness of each cell
population = Quicksort(population,1,length(population));

best{generation} = population{1}{1,1};
err(generation) = population{1}{1,2}; 
prev_error = population{1}{1,2};
generation = generation + 1;
end    
best_cand = population{1}{1,1};
err(generation-1) = population{1}{1,2};