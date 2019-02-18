function x = insertionsort(x)
n = length(x);
for j = 2:n
    pivot = x(j);
    i = j;
    while ((i > 1) && (x(i - 1) > pivot))
        x(i) = x(i - 1);
        i = i - 1;
    end
    x(i) = pivot;
end
end
