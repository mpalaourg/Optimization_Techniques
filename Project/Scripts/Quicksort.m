function [arr] = Quicksort(arr, low, high)
%Quicksort
%arr: The array, which i want to sort.
%low = The lower index limit.
%high = The higher index limit.
%return:
%arr = The array, after the sorting.
%
%Quicksort algorithm is recursive. At first, we apply partition so we can
%divide the problem, to two smaller problems. Then, we used Quicksort at
%each smaller problem, until we reach the final statement (1 element left
%at the arrays).
if low < high
    [arr, pi] = Partition(arr,low,high);
    arr = Quicksort(arr, low, pi - 1);
    arr = Quicksort(arr, pi + 1, high);
end