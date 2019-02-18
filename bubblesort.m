function x = bubblesort(x)

n = length(x);
while (n > 0)
    nnew = 0;
    for i = 2:n
        if (x(i) < x(i - 1))
            x = swap(x,i,i - 1);
            nnew = i;
        end
    end
    n = nnew;
end
end
function x = swap(x,i,j)
val = x(i);
x(i) = x(j);
x(j) = val;
end

