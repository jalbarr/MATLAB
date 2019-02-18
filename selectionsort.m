function x = selectionsort(x)

n = length(x);
for j = 1:(n - 1)
    imin = j;
    for i = (j + 1):n
        if (x(i) < x(imin))
            imin = i;
        end
    end
    
    if (imin ~= j)
        x = swap(x,imin,j);
    end
end
end
function x = swap(x,i,j)

val = x(i);
x(i) = x(j);
x(j) = val;
end
