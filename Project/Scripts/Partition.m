function [arr, index] = Partition(arr, low, high)
%Partition
%arr = The array, which i want to sort.
%low = The lower index limit
%high = The higher index limit
%return:
%arr = The array, after the partition
%index = The index, where the seperation was made
%
%At first, i choose the last element as pivot. Then, i check the elements,
%so the elements lesser than pivot were stored at the beginning of the arr
%(not sorted), and the elements greater than pivot were stored at the end
%of the arr. After, partition has ended we know that the pivot element will
%be somewhere in the middle, and all the elements before, is lesser than
%pivot and all the elements after, is bigger than pivot, BUT the arr WASNT
%SORTED.
pivot = arr{high}{1,2};
i = low - 1;

for j = low:high-1
    if arr{j}{1,2} <= pivot
        i = i + 1;
        temp = arr{j};
        arr{j} = arr{i};
        arr{i} = temp;
    end
end
temp = arr{i+1};
arr{i+1} = arr{high};
arr{high} = temp;
index = i + 1;
end