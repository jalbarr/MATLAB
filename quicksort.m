function x = quicksort(x)
kk = 15; % Insertion sort threshold, kk >= 1
% Quicksort
n = length(x);
x = quicksorti(x,1,n,kk);
end
function x = quicksorti(x,ll,uu,kk)

[x mm] = partition(x,ll,uu);
% Divide-and-conquer
if ((mm - ll) <= kk)
    % Sort x(ll:(mm - 1)) via insertion sort 
    x = insertionsorti(x,ll,mm - 1);
else
    % Sort x(ll:(mm - 1)) via quick sort 
    x = quicksorti(x,ll,mm - 1,kk);
end
if ((uu - mm) <= kk)
    % Sort x((mm + 1):uu) via insertion sort 
    x = insertionsorti(x,mm + 1,uu);
else
    % Sort x((mm + 1):uu) via quick sort 
    x = quicksorti(x,mm + 1,uu,kk);
end
end
function [x mm] = partition(x,ll,uu)

pp = medianofthree(x,ll,uu);

x = swap(x,ll,pp);
mm = ll;
for j = (ll + 1):uu
    if (x(j) < x(ll))
        mm = mm + 1;
        x = swap(x,mm,j);
    end
end
x = swap(x,ll,mm);
end
function pp = medianofthree(x,ll,uu)
mm = ll + floor((uu - ll) / 2);
if (x(ll) <= x(mm))
    if (x(uu) >= x(mm))
        pp = mm;
    elseif (x(uu) >= x(ll))
        pp = uu;
    else
        pp = ll;
    end
else
    if (x(uu) >= x(ll))
        pp = ll;
    elseif (x(uu) >= x(mm))
        pp = uu;
    else
        pp = mm;
    end
end
end
function x = insertionsorti(x,ll,uu)

for j = (ll + 1):uu
    pivot = x(j);
    i = j;
    while ((i > ll) && (x(i - 1) > pivot))
        x(i) = x(i - 1);
        i = i - 1;
    end
    x(i) = pivot;
end
end
function x = swap(x,i,j)
val = x(i);
x(i) = x(j);
x(j) = val;
end
